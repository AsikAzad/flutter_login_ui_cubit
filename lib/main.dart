import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:flutter_login_ui_cubit/utils/color_palette.dart';
import 'package:flutter_login_ui_cubit/utils/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isMale = true;
  bool isLoginScreen = true;

  @override
  Widget build(BuildContext context) {
    //Initialize SizeConfig object
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: SizeConfig.defaultSize * 30, //default size is 10
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/assets/images/travel_bg.jpg"),
                    fit: BoxFit.fill),
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: SizeConfig.defaultSize * 9,
                    left: SizeConfig.defaultSize * 1.5),
                color: ColorPalette.lightCyan.withOpacity(.75),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Welcome to",
                        style: TextStyle(
                          fontSize: SizeConfig.defaultSize * 2.5,
                          color: ColorPalette.yellowColor,
                        ),
                        children: [
                          TextSpan(
                            text: " Travellers BD",
                            style: TextStyle(
                              fontSize: SizeConfig.defaultSize * 2.5,
                              fontWeight: FontWeight.bold,
                              color: ColorPalette.yellowColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.defaultSize * .5),
                    Text(
                      isLoginScreen
                          ? "Login to Continue"
                          : "Sign up to Continue",
                      style: const TextStyle(
                        color: ColorPalette.whiteColor,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: isLoginScreen
                ? SizeConfig.defaultSize * 25
                : SizeConfig.defaultSize * 20,
            child: Container(
              height: isLoginScreen
                  ? SizeConfig.defaultSize * 38.5
                  : SizeConfig.defaultSize * 48.5,
              width: SizeConfig.screenWidth - (SizeConfig.defaultSize * 5),
              margin:
                  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 2),
              padding: EdgeInsets.all(SizeConfig.defaultSize * 2),
              decoration: BoxDecoration(
                color: ColorPalette.whiteColor,
                borderRadius:
                    BorderRadius.circular(SizeConfig.defaultSize * 1.5),
                boxShadow: [
                  BoxShadow(
                    color: ColorPalette.shadowColor,
                    blurRadius: SizeConfig.defaultSize * 1.5,
                    spreadRadius: SizeConfig.defaultSize * .5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isLoginScreen = true;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "LOGIN",
                              style: TextStyle(
                                fontSize: SizeConfig.defaultSize * 1.6,
                                fontWeight: FontWeight.bold,
                                color: isLoginScreen
                                    ? ColorPalette.activeColor
                                    : ColorPalette.textColor1,
                              ),
                            ),
                            if (isLoginScreen)
                              Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.defaultSize * .3),
                                height: SizeConfig.defaultSize * .2,
                                width: SizeConfig.defaultSize * 6,
                                color: ColorPalette.yellowColor,
                              ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isLoginScreen = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "SIGNUP",
                              style: TextStyle(
                                fontSize: SizeConfig.defaultSize * 1.6,
                                fontWeight: FontWeight.bold,
                                color: !isLoginScreen
                                    ? ColorPalette.activeColor
                                    : ColorPalette.textColor1,
                              ),
                            ),
                            if (!isLoginScreen)
                              Container(
                                margin: EdgeInsets.only(
                                    top: SizeConfig.defaultSize * .3),
                                height: SizeConfig.defaultSize * .2,
                                width: SizeConfig.defaultSize * 6,
                                color: ColorPalette.yellowColor,
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: SizeConfig.defaultSize * 2),
                    child: Column(
                      children: [
                        if (!isLoginScreen)
                          buildTextField(
                            const Icon(Icons.person_2_outlined,
                                color: ColorPalette.iconColor),
                            "User Name",
                            false,
                            false,
                          ),
                        buildTextField(
                          const Icon(Icons.email_outlined,
                              color: ColorPalette.iconColor),
                          "Email",
                          true,
                          false,
                        ),
                        buildTextField(
                          const Icon(Icons.email_outlined,
                              color: ColorPalette.iconColor),
                          "Password",
                          false,
                          true,
                        ),
                        if (!isLoginScreen)
                          buildTextField(
                            const Icon(Icons.email_outlined,
                                color: ColorPalette.iconColor),
                            "Re-type Password",
                            false,
                            true,
                          ),
                        if (!isLoginScreen)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isMale = true;
                                      });
                                    },
                                    child: Container(
                                      height: SizeConfig.defaultSize * 3,
                                      width: SizeConfig.defaultSize * 3,
                                      margin: EdgeInsets.only(
                                          right: SizeConfig.defaultSize),
                                      decoration: BoxDecoration(
                                        color: isMale
                                            ? ColorPalette.textColor2
                                            : Colors.transparent,
                                        border: Border.all(
                                            width: SizeConfig.defaultSize * .1,
                                            color: isMale
                                                ? ColorPalette.textColor2
                                                : ColorPalette.textColor1),
                                        borderRadius: BorderRadius.circular(
                                            SizeConfig.defaultSize * 1.5),
                                      ),
                                      child: Icon(
                                        Icons.male_outlined,
                                        color: isMale
                                            ? Colors.white
                                            : ColorPalette.iconColor,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isMale = true;
                                      });
                                    },
                                    child: const Text(
                                      "Male",
                                      style: TextStyle(
                                          color: ColorPalette.textColor1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.defaultSize * 3,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isMale = false;
                                      });
                                    },
                                    child: Container(
                                      height: SizeConfig.defaultSize * 3,
                                      width: SizeConfig.defaultSize * 3,
                                      margin: EdgeInsets.only(
                                          right: SizeConfig.defaultSize),
                                      decoration: BoxDecoration(
                                        color: !isMale
                                            ? ColorPalette.textColor2
                                            : Colors.transparent,
                                        border: Border.all(
                                          width: SizeConfig.defaultSize * .1,
                                          color: !isMale
                                              ? ColorPalette.textColor2
                                              : ColorPalette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            SizeConfig.defaultSize * 1.5),
                                      ),
                                      child: Icon(
                                        Icons.female_outlined,
                                        color: !isMale
                                            ? Colors.white
                                            : ColorPalette.iconColor,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isMale = false;
                                      });
                                    },
                                    child: const Text(
                                      "Female",
                                      style: TextStyle(
                                          color: ColorPalette.textColor1),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        Container(
                          width: SizeConfig.defaultSize * 25,
                          margin:
                              EdgeInsets.only(top: SizeConfig.defaultSize * 2),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text: "By clicking 'Submit' you agree \nto our ",
                              style: TextStyle(color: ColorPalette.textColor2),
                              children: [
                                TextSpan(
                                  // recognizer: ,
                                  text: "terms & conditions",
                                  style: TextStyle(
                                      color: ColorPalette.yellowColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.defaultSize * 2),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorPalette.lightCyan),
                          child: const Text("SUBMIT"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (!isLoginScreen)
            Positioned(
              top: SizeConfig.defaultSize * 72,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const Text(
                    "or Signup with",
                    style: TextStyle(
                      color: ColorPalette.lightCyan,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: SizeConfig.defaultSize * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildSignUpButton(MaterialCommunityIcons.facebook,
                          ColorPalette.facebookColor, "Facebook"),
                      buildSignUpButton(MaterialCommunityIcons.google_plus,
                          ColorPalette.googleColor, "Google"),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  TextButton buildSignUpButton(IconData icon, Color iconColor, String text) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        minimumSize:
            Size(SizeConfig.defaultSize * 13, SizeConfig.defaultSize * 4),
        backgroundColor: ColorPalette.whiteColor,
        side: const BorderSide(width: 1, color: ColorPalette.iconColor),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          SizedBox(width: SizeConfig.defaultSize * .5),
          Text(
            text,
            style: TextStyle(color: iconColor, letterSpacing: 2),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(
      Icon icon, String hintText, bool isEmail, bool isPassword) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.defaultSize),
      child: TextField(
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        obscureText: isPassword,
        decoration: InputDecoration(
            prefixIcon: icon,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorPalette.textColor1),
              borderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.defaultSize * 3.5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorPalette.textColor1),
              borderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.defaultSize * 3.5)),
            ),
            contentPadding: EdgeInsets.all(SizeConfig.defaultSize),
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: SizeConfig.defaultSize * 1.4,
                color: ColorPalette.textColor1)),
      ),
    );
  }
}
