import 'package:json_annotation/json_annotation.dart';
import "user.dart";
part 'users.g.dart';

@JsonSerializable()
class Users {
  Users();

  late List<User> users;

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
  Map<String, dynamic> toJson() => _$UsersToJson(this);

  static Users filterList(Users users, String filterString) {
    Users temUsers = users;
    List<User> usersList = temUsers.users
        .where((u) =>
            (u.name.toLowerCase().contains(filterString.toLowerCase())) ||
            (u.email.toLowerCase().contains(filterString.toLowerCase())))
        .toList();
    users.users = usersList;
    return users;
  }
}
