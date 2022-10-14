import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:upkeep_client/constants.dart';
import 'package:upkeep_client/models/user_response.dart';

class DashboardController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final apiURL = 'http://5.12.86.162/api/v1/users';
  var userTypeEdit = 'User'.obs;
  var userTypeAdd = 'User'.obs;

  void toggleMenu() {
    if (scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.closeDrawer();
    } else {
      scaffoldKey.currentState!.openDrawer();
    }
  }

  Future<UserResponse> fetchUsers(int offset, int pageSize) async {
    final response = await http.get(Uri.parse('$apiURL/$offset/$pageSize'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return UserResponse.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      Get.snackbar("Error", 'Something went wrong!');
      throw Exception('Failed to load album');
    }
  }

  openEditUser(User user) {
    TextEditingController nameTextController = TextEditingController();
    TextEditingController emailTextController = TextEditingController();
    TextEditingController phoneTextController = TextEditingController();

    nameTextController.text = user.name;
    emailTextController.text = user.email;
    phoneTextController.text = user.phone;
    userTypeEdit.value = user.type;

    Get.defaultDialog(
      title: 'Editing user #${user.id}',
      titlePadding: const EdgeInsets.only(top: 25, bottom: 25),
      radius: 0,
      backgroundColor: bgColor,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            TextField(
              controller: nameTextController,
              decoration: InputDecoration(
                hintText: 'Full Name',
                fillColor: secondaryColor,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 13),
            TextField(
              controller: emailTextController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
                fillColor: secondaryColor,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 13),
            TextField(
              controller: phoneTextController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                fillColor: secondaryColor,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Type'),
                  DropdownButtonHideUnderline(
                    child: Obx(
                      () => DropdownButton(
                        value: userTypeEdit.value,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: const [
                          DropdownMenuItem(
                            value: 'User',
                            child: Text('User'),
                          ),
                          DropdownMenuItem(
                            value: 'Admin',
                            child: Text('Admin'),
                          ),
                          DropdownMenuItem(
                            value: 'Banned',
                            child: Text('Banned'),
                          )
                        ],
                        onChanged: ((value) => userTypeEdit.value = value!),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding,
                    ),
                  ),
                  onPressed: () {
                    editUser(User(
                      id: user.id,
                      name: nameTextController.text,
                      email: emailTextController.text,
                      phone: phoneTextController.text,
                      type: userTypeEdit.value,
                    ));
                    Get.back();
                  },
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding,
                    ),
                  ),
                  onPressed: () => Get.back(),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  editUser(User user) async {
    final response = await http.post(
      Uri.parse('$apiURL/edit'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );
    if (response.statusCode == 200) {
      Get.snackbar('Success', 'User saved successfully!');
    } else {
      Get.snackbar('Error', 'Something went wrong!');
    }
  }

  openAddUser() {
    TextEditingController nameTextController = TextEditingController();
    TextEditingController emailTextController = TextEditingController();
    TextEditingController phoneTextController = TextEditingController();

    userTypeAdd.value = 'User';

    Get.defaultDialog(
      title: 'Adding new user',
      titlePadding: const EdgeInsets.only(top: 25, bottom: 25),
      radius: 0,
      backgroundColor: bgColor,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            TextField(
              controller: nameTextController,
              decoration: InputDecoration(
                hintText: 'Full Name',
                fillColor: secondaryColor,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 13),
            TextField(
              controller: emailTextController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
                fillColor: secondaryColor,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 13),
            TextField(
              controller: phoneTextController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                fillColor: secondaryColor,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Type'),
                  DropdownButtonHideUnderline(
                    child: Obx(
                      () => DropdownButton(
                        value: userTypeAdd.value,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: const [
                          DropdownMenuItem(
                            value: 'User',
                            child: Text('User'),
                          ),
                          DropdownMenuItem(
                            value: 'Admin',
                            child: Text('Admin'),
                          ),
                          DropdownMenuItem(
                            value: 'Banned',
                            child: Text('Banned'),
                          )
                        ],
                        onChanged: ((value) => userTypeAdd.value = value!),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding,
                    ),
                  ),
                  onPressed: () {
                    addUser(User(
                      name: nameTextController.text,
                      email: emailTextController.text,
                      phone: phoneTextController.text,
                      type: userTypeAdd.value,
                    ));
                    Get.back();
                  },
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding,
                    ),
                  ),
                  onPressed: () => Get.back(),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addUser(User user) async {
    final response = await http.post(
      Uri.parse('$apiURL/save'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );
    if (response.statusCode == 200) {
      Get.snackbar('Success', 'User saved successfully!');
    } else {
      Get.snackbar('Error', 'Something went wrong!');
    }
  }
}
