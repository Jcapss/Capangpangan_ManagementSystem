import 'dart:io';
import 'package:riverpod/riverpod.dart';
import 'providers.dart';
import 'models/user.dart';

void main() {
  final container = ProviderContainer();

  final userService = container.read(userServiceProvider);

  while (true) {
    print('\n1. Add User');
    print('2. Show Users');
    print('3. Edit User');
    print('4. Delete User');
    print('5. Exit');
    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();

    if (choice == '1') {
      
      stdout.write('Enter name: ');
      String? name = stdin.readLineSync();
      stdout.write('Enter age: ');
      String? ageInput = stdin.readLineSync();
      int age = int.tryParse(ageInput ?? '') ?? 0;

      if (name != null && name.isNotEmpty && age > 0) {
        userService.addUser(name, age);
        print('User added successfully!');
      } else {
        print('Invalid input, please try again.');
      }
    } else if (choice == '2') {
      
      List<User> users = userService.getUsers();
      if (users.isEmpty) {
        print('No users available.');
      } else {
        for (int i = 0; i < users.length; i++) {
          print('$i. ${users[i]}');
        }
      }
    } else if (choice == '3') {
      // Edit User Logic
      List<User> users = userService.getUsers();
      if (users.isEmpty) {
        print('No users to edit.');
      } else {
        for (int i = 0; i < users.length; i++) {
          print('$i. ${users[i]}');
        }
        stdout.write('Enter the index of the user you want to edit: ');
        String? indexInput = stdin.readLineSync();
        int index = int.tryParse(indexInput ?? '') ?? -1;

        if (index >= 0 && index < users.length) {
          stdout.write('Enter new name: ');
          String? newName = stdin.readLineSync();
          stdout.write('Enter new age: ');
          String? newAgeInput = stdin.readLineSync();
          int newAge = int.tryParse(newAgeInput ?? '') ?? 0;

          if (newName != null && newName.isNotEmpty && newAge > 0) {
            bool result = userService.editUser(index, newName, newAge);
            if (result) {
              print('User edited successfully!');
            } else {
              print('Error editing user.');
            }
          } else {
            print('Invalid input, please try again.');
          }
        } else {
          print('Invalid index.');
        }
      }
    } else if (choice == '4') {
      
      List<User> users = userService.getUsers();
      if (users.isEmpty) {
        print('No users to delete.');
      } else {
        for (int i = 0; i < users.length; i++) {
          print('$i. ${users[i]}');
        }
        stdout.write('Enter the index of the user you want to delete: ');
        String? indexInput = stdin.readLineSync();
        int index = int.tryParse(indexInput ?? '') ?? -1;

        if (index >= 0 && index < users.length) {
          bool result = userService.deleteUser(index);
          if (result) {
            print('User deleted successfully!');
          } else {
            print('Error deleting user.');
          }
        } else {
          print('Invalid index.');
        }
      }
    } else if (choice == '5') {
      
      print('Exiting...');
      break;
    } else {
      print('Invalid option, please try again.');
    }
  }

  container.dispose();
}
