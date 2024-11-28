import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_controller.dart';  // Import the User Controller

void main() {
  // Initialize UserController
  Get.put(UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserProfileScreen(),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key? key}) : super(key: key);
  
  // Get the instance of UserController
  final UserController controller = Get.find();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Obx widget to display name
            Obx(() => Text('Name: ${controller.name}', style: TextStyle(fontSize: 20))),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Enter your name'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.changeName(nameController.text);
              },
              child: Text('Update Name'),
            ),
            SizedBox(height: 20),

            // Obx widget to display email
            Obx(() => Text('Email: ${controller.email}', style: TextStyle(fontSize: 20))),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Enter your email'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.changeEmail(emailController.text);
              },
              child: Text('Update Email'),
            ),
            SizedBox(height: 20),

            // Obx widget to display age
            Obx(() => Text('Age: ${controller.age}', style: TextStyle(fontSize: 20))),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter your age'),
            ),
            ElevatedButton(
              onPressed: () {
                int newAge = int.tryParse(ageController.text) ?? 0;
                controller.changeAge(newAge);
              },
              child: Text('Update Age'),
            ),
          ],
        ),
      ),
    );
  }
}