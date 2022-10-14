import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:upkeep_client/constants.dart';
import 'package:upkeep_client/models/user_response.dart';

class DashboardController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final apiURL = 'http://5.12.86.162';
  var userType = 'User'.obs;

  void toggleMenu() {
    if (scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.closeDrawer();
    } else {
      scaffoldKey.currentState!.openDrawer();
    }
  }

  Future<UserResponse> fetchUsers(int offset, int pageSize) async {
    final response =
        await http.get(Uri.parse('$apiURL/api/v1/users/$offset/$pageSize'));

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
    userType.value = user.type;

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
                        value: userType.value,
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
                        onChanged: ((value) => userType.value = value!),
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
                  onPressed: () {},
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
}
