State Management with GetX - User Profile Management App

Create a new Flutter project.

Add the GetX package:

Add get: ^4.6.5 to your pubspec.yaml file and run flutter pub get.

Create a User Controller:

In lib, create user_controller.dart.

Define a UserController that extends GetxController:

Properties like name, email, and age defined as RxString or RxInt.

Methods to update each piece of user information (changeName, changeEmail)

Create the User Profile Screen:

Use Get.put() to initialize UserController in main.dart.

Use Scaffold with an AppBar titled "User Profile".

Widgets:

TextFields for name, email, and age inputs.

ElevatedButton to update each piece of information.

Use Obx to display user information live on the screen.

Make It Interactive:

When users change their information and click the update button, the updated value should be shown immediately using Obx.

Test Your App:

Users should be able to update their profile details and see the changes reflected in real-time.
