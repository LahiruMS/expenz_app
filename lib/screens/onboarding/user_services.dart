import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  //method for the store the user name and email in shared preferences
  static Future<void> storeUserDetails({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    try {
      //check the password and confirm password are same
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Password and confirm password do not match"),
          ),
        );
        return;
      }
      //password are same then store the user name and email

      SharedPreferences prefs = await SharedPreferences.getInstance();
      //store usename and email as key value pair
      await prefs.setString("username", userName);
      await prefs.setString("email", email);
      //display message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("User Details saved successfully."),
        ),
      );
    } catch (err) {
      err.toString();
    }
  }
}
