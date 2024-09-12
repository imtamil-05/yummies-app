import 'dart:async';

import 'package:flutter/material.dart';

class LoginPageViewModel {
  bool isSignIn = true;
  String selectedTab = "signIn";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  StreamController loginButtonStreamController = StreamController<bool>();
  bool validateLoginButton() {
    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      return true;}
      else {return false;}
  }
}