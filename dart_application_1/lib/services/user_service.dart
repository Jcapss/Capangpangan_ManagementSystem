import '../models/user.dart';

class UserService {
  final List<User> _users = [];

  void addUser(String name, int age) {
    _users.add(User(name: name, age: age));
  }

  List<User> getUsers() => _users;

  bool deleteUser(int index) {
    if (index >= 0 && index < _users.length) {
      _users.removeAt(index);
      return true;
    }
    return false;
  }

  bool editUser(int index, String newName, int newAge) {
    if (index >= 0 && index < _users.length) {
      _users[index] = User(name: newName, age: newAge);
      return true;
    }
    return false;
  }
}

