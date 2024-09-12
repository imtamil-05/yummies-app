import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yummies_app/image_assets.dart';
import 'package:yummies_app/pages/loginpage/login_page.dart';
import 'package:yummies_app/pages/loginpage/login_page_view_model.dart';
import 'package:yummies_app/themes/color_theme.dart';

class LoginPageView extends State<LoginPage> {
  LoginPageViewModel loginPageViewModel = LoginPageViewModel();
  bool isObscureText = true;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();

    loginPageViewModel.loginButtonStreamController=StreamController<bool>.broadcast();
        
  }
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageSection(),
          tabSection(),
        ],
      ),
    );
  }

  Widget tabSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Expanded(
                child: tabMenu("signIn", "Sign In"),
              ),
              Expanded(
                child: tabMenu("signUp", "Sign Up"),
              )
            ],
          ),
        ),
        Container(
          child: loginPageViewModel.selectedTab == "signIn"
              ? signInSection()
              : signUpSection(),
        ),
      ],
    );
  }

  Widget tabMenu(String type, String buttonText) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (type == "signIn") {
            loginPageViewModel.selectedTab = "signIn";
          } else {
            loginPageViewModel.selectedTab = "signUp";
          }
          ;
        });
      },
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration:
            ((loginPageViewModel.selectedTab == "signIn" && type == "signIn") ||
                    (loginPageViewModel.selectedTab == "signUp" &&
                        type == "signUp"))
                ? BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: ColorTheme.colorTheme.primaryColor, width: 2),
                    ),
                  )
                : BoxDecoration(),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              color: ((loginPageViewModel.selectedTab == "signIn" &&
                          type == "signIn") ||
                      (loginPageViewModel.selectedTab == "signUp" &&
                          type == "signUp"))
                  ? ColorTheme.colorTheme.primaryColor
                  : ColorTheme.colorTheme.primaryLightColor),
        ),
      ),
    );
  }

  Widget imageSection() {
    return Container(
        height: 200,
        width: 200,
        
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: AssetImage(
                ImageAssets.logo,
              ),
              fit: BoxFit.fill,
            )));
  }

  Widget signInSection() {
    return Container(
      padding: EdgeInsets.all(20),
      //color: const Color.fromARGB(255, 245, 244, 244),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "E-mail address",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          TextField(
            style: TextStyle(fontSize: 15),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5.0),
              //hintText: "Email",

              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 0.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 0.0,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            controller: loginPageViewModel.emailController,
            onChanged: (value) {
              setState(() {
              //  loginPageViewModel.validateLoginButton();
                loginPageViewModel.loginButtonStreamController.add(true);
              });
            },
          ),
          SizedBox(height: 10),
          const Text(
            "Enter Password",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: loginPageViewModel.passwordController,
            onChanged: (value){
              setState(() {
                loginPageViewModel.loginButtonStreamController.add(true);
              });
            },
              style: TextStyle(fontSize: 15),
              obscureText:
                  isObscureText, // Controls whether the text is hidden or visible
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                //labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                suffixIcon: InkWell(
                    onTap: obscureText,
                    // setState(() { isObscureText = !isObscureText; }); },
                    child: const Icon(Icons.visibility)),
              )),
          SizedBox(height: 5.0),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                  fontSize: 10, fontWeight: FontWeight.w300, fontFamily: ""),
            ),
          ),
          SizedBox(height: 5.0),
          Center(
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Checkbox(
              value: isChecked,
              onChanged: (bool? newValue) {
                setState(() {
                  isChecked = newValue!;
               });
              },
              checkColor: ColorTheme.colorTheme.primaryColor,
              activeColor: Colors.grey,
            ),
            Text(
              'Remember me',
              style: TextStyle(fontSize: 15.0),
            ),
          ])),
          SizedBox(height: 10.0),
          
          Center(
            child: StreamBuilder<dynamic>(        
              stream: loginPageViewModel.loginButtonStreamController.stream,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                 
                  // TODO: the data is not ready, show a loading indicator
                  return ElevatedButton(
                     onPressed: () {
                     
                  print('Login successfully');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: loginPageViewModel.validateLoginButton()
                      ? ColorTheme.colorTheme.primaryColor
                      : ColorTheme.colorTheme.greyColor,
                  //disabledForegroundColor: ColorTheme.colorTheme.primaryLightColor.withOpacity(0.38), disabledBackgroundColor: ColorTheme.colorTheme.primaryLightColor.withOpacity(0.12),
            
                  padding: EdgeInsets.symmetric(
                      horizontal: 90, vertical: 8), // Padding inside the button
                  elevation: 10, // Shadow elevation
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "helvetica",
                      color: Colors.white),
                ),
                    
                  );
               },
            ),
          ),
          SizedBox(height: 20.0),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Divider(thickness: 1, color: Colors.grey),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('OR'),
                ),
                const Expanded(
                  child: Divider(thickness: 1, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Center(
            child: const Text(
              "Sign in using:",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 15.0),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                  alignment: Alignment.center,
                  child: Image.asset('assets/icons/google.png'),
                ),

                Container(
                  height: 44,
                  width: 44,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                  alignment: Alignment.center,
                  child: const Icon(Icons.facebook),
                ),
                Container(
                  height: 44,
                  width: 44,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                  alignment: Alignment.center,
                  child: ImageIcon(AssetImage('assets/icons/twitter.png')),
                ),

                // ImageIcon( AssetImage('assets/images/google.png'), color: Colors.white,),
                //Icon(Icons.facebook,color:Colors.white),
                //ImageIcon( AssetImage('assets/images/twitter.png'), color: Colors.white,),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget signUpSection() {
    return Container(
      padding: EdgeInsets.all(20),
      //color: const Color.fromARGB(255, 245, 244, 244),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Full Name",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
           TextField(
            controller: loginPageViewModel.nameController,
            onChanged: (value) {
              setState(() {
                
              });
            },
            style: TextStyle(fontSize: 15),
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5.0),
              //hintText: "Name",
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 0.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 0.0,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          const Text(
            "E-mail address",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
           TextField(
            controller: loginPageViewModel.emailAddressController,
            onChanged: (value) {
              setState(() {
                
              });
            },
            style: TextStyle(fontSize: 15),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5.0),
              //hintText: "Email",
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 0.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 0.0,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          const Text(
            "Create Password",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          TextField(
              style: TextStyle(fontSize: 15),
              obscureText:
                  isObscureText, // Controls whether the text is hidden or visible
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                //labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                suffixIcon: InkWell(
                    onTap: obscureText,
                    // setState(() { isObscureText = !isObscureText; }); },
                    child: const Icon(Icons.visibility)),
              )),
          SizedBox(height: 20.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                print('Account created');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorTheme.colorTheme.primaryColor,
                disabledForegroundColor:
                    ColorTheme.colorTheme.primaryLightColor.withOpacity(0.38),
                disabledBackgroundColor:
                    ColorTheme.colorTheme.primaryLightColor.withOpacity(0.12),

                padding: EdgeInsets.symmetric(
                    horizontal: 60, vertical: 8), // Padding inside the button
                elevation: 10, // Shadow elevation
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
              ),
              child: Text(
                'Create Account',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: "helvetica",
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Divider(thickness: 1, color: Colors.grey),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('OR'),
                ),
                const Expanded(
                  child: Divider(thickness: 1, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Center(
            child: const Text(
              "Sign in using:",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 15.0),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                  alignment: Alignment.center,
                  child: const ImageIcon(AssetImage('assets/icons/google.png')),
                ),
                Container(
                  height: 44,
                  width: 44,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                  alignment: Alignment.center,
                  child: const Icon(Icons.facebook),
                ),
                Container(
                  height: 44,
                  width: 44,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                  alignment: Alignment.center,
                  child: ImageIcon(AssetImage('assets/icons/twitter.png')),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void obscureText() {
    setState(() {
      isObscureText = !isObscureText;
    });
  }

  Widget iconBox(IconData? icon, ImageProvider<Object>? image, Color? color,
      double? height, double? width) {
    return Container(
      height: 44,
      width: 44,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromARGB(255, 153, 193, 225)),
      alignment: Alignment.center,
      child: Icon(icon, color: color),
    );
  }
}
