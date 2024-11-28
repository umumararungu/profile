import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var age = 0.obs;

  @override
  void onInit() {
    loadUserData();
    super.onInit();
  }

  void changeName(String newName) {
    name.value = newName;
    saveUserData();
  }

  void changeEmail(String newEmail) {
    email.value = newEmail;
    saveUserData();
  }

  void changeAge(int newAge) {
    age.value = newAge;
    saveUserData();
  }

  Future<void> saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name.value);
    await prefs.setString('email', email.value);
    await prefs.setInt('age', age.value);
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('name') ?? '';
    email.value = prefs.getString('email') ?? '';
    age.value = prefs.getInt('age') ?? 0;
  }
}