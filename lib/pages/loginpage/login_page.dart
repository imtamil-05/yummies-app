import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:yummies_app/pages/loginpage/login_page_view.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  LoginPageView createState() => LoginPageView();
}