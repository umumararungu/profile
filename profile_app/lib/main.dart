import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_controller.dart';  // Import the User Controller

void main() {
  // Initialize UserController
  Get.put(UserController());
  runApp(const MyApp());
}

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key? key}) : super(key: key);

  final UserController controller = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = controller.name.value;
    emailController.text = controller.email.value;
    ageController.text = controller.age.value.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Display Name
            Obx(() => Text('Name: ${controller.name}', style: TextStyle(fontSize: 20))),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Enter your name'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  controller.changeName(nameController.text);
                } else {
                  Get.snackbar('Error', 'Name cannot be empty');
                }
              },
              child: Text('Update Name'),
            ),
            SizedBox(height: 20),

            // Display Email
            Obx(() => Text('Email: ${controller.email}', style: TextStyle(fontSize: 20))),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Enter your email'),
            ),
            ElevatedButton(
              onPressed: () {
                if (GetUtils.isEmail(emailController.text)) {
                  controller.changeEmail(emailController.text);
                } else {
                  Get.snackbar('Error', 'Enter a valid email');
                }
              },
              child: Text('Update Email'),
            ),
            SizedBox(height: 20),

            // Display Age
            Obx(() => Text('Age: ${controller.age}', style: TextStyle(fontSize: 20))),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter your age'),
            ),
            ElevatedButton(
              onPressed: () {
                int newAge = int.tryParse(ageController.text) ?? -1;
                if (newAge > 0) {
                  controller.changeAge(newAge);
                } else {
                  Get.snackbar('Error', 'Please enter a valid age');
                }
              },
              child: Text('Update Age'),
            ),
          ],
        ),
      ),
    );
  }
}