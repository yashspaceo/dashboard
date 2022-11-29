import 'package:dashboard/data/local/database/database_manager.dart';
import 'package:dashboard/data/local/database/entity/user.dart' as local_user;
import 'package:dashboard/utility/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PersonController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxList<local_user.User> userList = <local_user.User>[].obs;

  /// on form submit funtction
  void onSubmit() {
    if (checkValidation()) {
      Utils.showMessage("Success.", "Sucessfully....");

      DatabaseManager().addUser(
        local_user.User(
          name: nameController.text,
          number: numberController.text,
          email: emailController.text,
          password: passwordController.text,
        ),
      ); // add user into local database

      getUserList();
      // DatabaseManager().removeAllUsers();

      nameController.clear();
      numberController.clear();
      emailController.clear();
      passwordController.clear();

    }
  }

  /// Get user list to display
  void getUserList() async {
    userList.clear();
    // isLoadingUsers.value = true;
    var users = await DatabaseManager().getAllUsers();
    // isLoadingUsers.value = false;
    userList.assignAll(users);
  }

  /// checkvalidation of register form
  bool checkValidation() {
    Utils.closeKeyboard();
    if (nameController.text.trim().isEmpty) {
      Utils.showMessage("Error.", "Full Name field is empty.");
      return false;
    } else if (numberController.text.trim().isEmpty) {
      Utils.showMessage("Error.", "Number field is empty.");
      return false;
    } else if (numberController.text.length != 10) {
      Utils.showMessage("Error.", "Please enter valid number.");
      return false;
    } else if (emailController.text.trim().isEmpty) {
      Utils.showMessage("Error.", "Email field is empty.");
      return false;
    } else if (!emailController.text.trim().isEmail) {
      Utils.showMessage("Error.", "Please enter valid email.");
      return false;
    } else if (passwordController.text.trim().isEmpty) {
      Utils.showMessage("Error.", "Password field is empty.");
      return false;
    } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(passwordController.text.trim())) {
      Utils.showMessage("Error.",
          "Password should contains min. 8 characters, one digit, Special characters, Upper case & lower case letter.");
      return false;
    }
    return true;
  }
}
