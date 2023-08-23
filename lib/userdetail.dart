import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/user.dart';

class UserDetail extends StatelessWidget {
  final User user;

  const UserDetail({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Align(
              alignment: Alignment.center,
            ),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/image/007.jpg'),
            ),
            Text(
              user.name,
              style: TextStyle(
                fontSize: 30.0,
                color: Color.fromARGB(255, 95, 199, 121),
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico",
              ),
            ),
            Text(
              user.username,
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 96, 206, 143),
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Source Sans Pro"),
            ),
            SizedBox(
              height: 20,
              width: 300,
              child: Divider(
                color: Color.fromARGB(255, 77, 234, 137),
              ),
            ),
            phone(),
            mail(),
            web(),
            company(),
            address(),
          ],
        ),
      ),
    );
  }

  Widget company() {
    return GestureDetector(
      child: Card(
        color: const Color.fromARGB(255, 144, 228, 147),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: ListTile(
          leading: Icon(
            Icons.business,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          title: Text(
            user.company.name,
            style: TextStyle(
              color: const Color.fromARGB(255, 3, 5, 5),
              fontSize: 20,
              fontFamily: "Source Sans Pro",
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.company.catchPhrase,
                style: TextStyle(
                  color: const Color.fromARGB(255, 9, 12, 11),
                  fontSize: 16,
                  fontFamily: "Source Sans Pro",
                ),
              ),
              Text(
                user.company.bs,
                style: TextStyle(
                  color: const Color.fromARGB(255, 22, 27, 27),
                  fontSize: 16,
                  fontFamily: "Source Sans Pro",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget address() {
    return GestureDetector(
      child: Card(
        color: const Color.fromARGB(255, 146, 212, 148),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: ListTile(
          leading: Icon(
            Icons.location_on,
            color: const Color.fromARGB(255, 12, 15, 15),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "city: " + user.address.city,
                style: TextStyle(
                  color: const Color.fromARGB(255, 23, 27, 26),
                  fontSize: 16,
                  fontFamily: "Source Sans Pro",
                ),
              ),
              Text(
                "street: " + user.address.street,
                style: TextStyle(
                  color: const Color.fromARGB(255, 16, 18, 18),
                  fontSize: 16,
                  fontFamily: "Source Sans Pro",
                ),
              ),
              Text(
                "suite: " + user.address.suite,
                style: TextStyle(
                  color: const Color.fromARGB(255, 7, 8, 8),
                  fontSize: 16,
                  fontFamily: "Source Sans Pro",
                ),
              ),
              Text(
                "zipcode: " + user.address.zipcode,
                style: TextStyle(
                  color: const Color.fromARGB(255, 17, 20, 19),
                  fontSize: 16,
                  fontFamily: "Source Sans Pro",
                ),
              ),
              Text(
                "lat: " + user.address.geo.lat,
                style: TextStyle(
                  color: const Color.fromARGB(255, 20, 24, 24),
                  fontSize: 16,
                  fontFamily: "Source Sans Pro",
                ),
              ),
              Text(
                "lng: " + user.address.geo.lng,
                style: TextStyle(
                  color: const Color.fromARGB(255, 22, 25, 25),
                  fontSize: 16,
                  fontFamily: "Source Sans Pro",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget web() {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: ListTile(
          leading: Icon(
            Icons.web,
            color: Colors.teal,
          ),
          title: Text(
            user.website,
            style: TextStyle(
                color: Colors.teal,
                fontSize: 20,
                fontFamily: "Source Sans Pro"),
          ),
        ),
      ),
    );
  }

  Widget mail() {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: ListTile(
          leading: Icon(
            Icons.mail,
            color: Colors.teal,
          ),
          title: Text(
            user.email,
            style: TextStyle(
                color: Colors.teal,
                fontSize: 20,
                fontFamily: "Source Sans Pro"),
          ),
        ),
      ),
    );
  }

  Widget phone() {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: ListTile(
          leading: Icon(
            Icons.phone,
            color: Colors.teal,
          ),
          title: Text(
            user.phone,
            style: TextStyle(
                color: Colors.teal,
                fontSize: 20,
                fontFamily: "Source Sans Pro"),
          ),
        ),
      ),
    );
  }
}
