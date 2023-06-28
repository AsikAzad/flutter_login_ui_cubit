import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:flutter_login_ui_cubit/utils/color_palette.dart';
import 'package:sizer/sizer.dart';

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
    // SizeConfig().init(context);

    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
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
                  height: 38.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/assets/images/travel_bg.jpg"),
                        fit: BoxFit.fill),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 11.h, left: 10 * 1.5),
                    color: ColorPalette.lightCyan.withOpacity(.75),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Welcome to",
                            style: TextStyle(
                              fontSize: 6.w,
                              color: ColorPalette.yellowColor,
                            ),
                            children: [
                              TextSpan(
                                text: " Travellers BD",
                                style: TextStyle(
                                  fontSize: 6.w,
                                  fontWeight: FontWeight.bold,
                                  color: ColorPalette.yellowColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 1.h),
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
                top: isLoginScreen ? 27.h : 22.h,
                child: Container(
                  height: isLoginScreen ? 43.h : 63.1.h,
                  width: 90.w,
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: ColorPalette.whiteColor,
                    borderRadius: BorderRadius.circular(4.5.w),
                    boxShadow: [
                      BoxShadow(
                        color: ColorPalette.shadowColor,
                        blurRadius: 4.5.w,
                        spreadRadius: 1.w,
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
                                    fontSize: 3.5.w,
                                    fontWeight: FontWeight.bold,
                                    color: isLoginScreen
                                        ? ColorPalette.activeColor
                                        : ColorPalette.textColor1,
                                  ),
                                ),
                                if (isLoginScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 10 * .3),
                                    height: 10 * .2,
                                    width: 10 * 6,
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
                                    fontSize: 3.5.w,
                                    fontWeight: FontWeight.bold,
                                    color: !isLoginScreen
                                        ? ColorPalette.activeColor
                                        : ColorPalette.textColor1,
                                  ),
                                ),
                                if (!isLoginScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 10 * .3),
                                    height: 10 * .2,
                                    width: 10 * 6,
                                    color: ColorPalette.yellowColor,
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 1.8.h),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                          height: 10 * 3,
                                          width: 10 * 3,
                                          margin: EdgeInsets.only(right: 3.w),
                                          decoration: BoxDecoration(
                                            color: isMale
                                                ? ColorPalette.textColor2
                                                : Colors.transparent,
                                            border: Border.all(
                                                width: 10 * .1,
                                                color: isMale
                                                    ? ColorPalette.textColor2
                                                    : ColorPalette.textColor1),
                                            borderRadius:
                                                BorderRadius.circular(10 * 1.5),
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
                                        width: 6.w,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isMale = false;
                                          });
                                        },
                                        child: Container(
                                          height: 10 * 3,
                                          width: 10 * 3,
                                          margin: EdgeInsets.only(right: 3.5.w),
                                          decoration: BoxDecoration(
                                            color: !isMale
                                                ? ColorPalette.textColor2
                                                : Colors.transparent,
                                            border: Border.all(
                                              width: 10 * .1,
                                              color: !isMale
                                                  ? ColorPalette.textColor2
                                                  : ColorPalette.textColor1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10 * 1.5),
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
                              width: 60.w,
                              margin: EdgeInsets.only(top: 1.5.h),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  text:
                                      "By clicking 'Submit' you agree \nto our ",
                                  style:
                                      TextStyle(color: ColorPalette.textColor2),
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
                            SizedBox(height: 1.5.h),
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
                  top: 88.h,
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
                      SizedBox(height: 1.5.h),
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
      },
    );
  }

  TextButton buildSignUpButton(IconData icon, Color iconColor, String text) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        minimumSize: Size(10 * 13, 10 * 4),
        backgroundColor: ColorPalette.whiteColor,
        side: const BorderSide(width: 1, color: ColorPalette.iconColor),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          SizedBox(width: 10 * .5),
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
      padding: EdgeInsets.only(bottom: 1.5.h),
      child: TextField(
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        obscureText: isPassword,
        decoration: InputDecoration(
            prefixIcon: icon,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorPalette.textColor1),
              borderRadius: BorderRadius.all(Radius.circular(10 * 3.5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorPalette.textColor1),
              borderRadius: BorderRadius.all(Radius.circular(10 * 3.5)),
            ),
            contentPadding: EdgeInsets.all(2.w),
            hintText: hintText,
            hintStyle:
                TextStyle(fontSize: 3.5.w, color: ColorPalette.textColor1)),
      ),
    );
  }
}
