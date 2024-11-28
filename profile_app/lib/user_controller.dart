import 'package:get/get.dart';

class UserController extends GetxController {
  // Define user properties
  var name = ''.obs;
  var email = ''.obs;
  var age = 0.obs; // Using RxInt for age

  // Methods to update user information
  void changeName(String newName) {
    name.value = newName;
  }

  void changeEmail(String newEmail) {
    email.value = newEmail;
  }

  void changeAge(int newAge) {
    age.value = newAge;
  }
}
