import 'package:flutter/material.dart';
import 'dart:async';
import 'Services.dart';
import 'models/users.dart';
import 'userdetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final debouncer = Debouncer(milliseconds: 1000);

  late Users users;
  late String title;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    title = 'Loading users...';
    users = Users();
    isLoading = true;

    Servies.getUsers().then((usersFromServer) {
      setState(() {
        users = usersFromServer;
        title = widget.title;
        isLoading = false;
      });
    });
  }

  Widget list() {
    return Expanded(
      child: ListView.builder(
        itemCount: users.users == null ? 0 : users.users.length,
        itemBuilder: (BuildContext context, int index) {
          return row(index);
        },
      ),
    );
  }

  Widget row(int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: const Icon(
                IconData(0xe61e, fontFamily: 'MaterialIcons'),
                size: 50,
              ),
              title: Text("Name: ${users.users[index].name}",
                  style: const TextStyle(color: Colors.green, fontSize: 16)),
              subtitle: Text("Email: ${users.users[index].email.toLowerCase()}",
                  style: const TextStyle(color: Colors.green, fontSize: 14)),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserDetail(
                          user: users!.users[index],
                        )));
              },
            )
          ],
        ),
      ),
    );
  }

  Widget searchTF() {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(15.0),
        hintText: 'Filter by name or email',
      ),
      onChanged: (String) {
        debouncer.run(() {
          setState(() {
            title = 'Searching...';
          });
          Servies.getUsers().then((usersFromServer) {
            setState(() {
              users = Users.filterList(usersFromServer, String);
              title = widget.title;
            });
          });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: <Widget>[
                  searchTF(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  list(),
                ],
              ),
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(microseconds: milliseconds), action);
  }
}
