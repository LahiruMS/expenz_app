import 'package:expenz/contains/color.dart';
import 'package:expenz/contains/constants.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  //for the checkbox
  bool _rememberMe = false;

  //form key for the form validation
  final _formKey = GlobalKey<FormState>();

  //controllers for save the states in the inputs
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordContorller = TextEditingController();
  final TextEditingController _confirmPasswordContorller =
      TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordContorller.dispose();
    _confirmPasswordContorller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(kDefalutPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter your \nPersonal Details",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),

              SizedBox(
                height: 30,
              ),

              //form
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //form field for the user name
                    TextFormField(
                      controller: _usernameController,
                      validator: (value) {
                        //check weather the username is entered
                        if (value!.isEmpty) {
                          return "Please Enter Your Name";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //form field for the email
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Your Email";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //form field for the Password
                    TextFormField(
                      controller: _passwordContorller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter A Valid Password";
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //form field for the confirm Password
                    TextFormField(
                      controller: _confirmPasswordContorller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter A Valid Password";
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    //remember me for next time
                    Row(
                      children: [
                        Text(
                          "Remember for the next time",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: kGrey,
                          ),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                              activeColor: kMainColor,
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),

                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          // Form is valid, process data
                          String username = _usernameController.text;
                          String email = _emailController.text;
                          String password = _passwordContorller.text;
                          String confirmPassword =
                              _confirmPasswordContorller.text;

                          print("$username $email $password $confirmPassword");
                        }
                      },
                      child: CustomButton(
                          buttonName: "Next", buttonColor: kMainColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
