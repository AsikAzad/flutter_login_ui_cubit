import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:flutter_login_ui_cubit/utils/color_palette.dart';
import 'package:flutter_login_ui_cubit/utils/size_config.dart';
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
    SizeConfig().init(context);

    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return GestureDetector(
          onTap: () {
            SystemChannels.textInput.invokeMethod('TextInput.hide');
          },
          child: Scaffold(
            backgroundColor: ColorPalette.backgroundColor,
            body: orientation == Orientation.portrait
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: buildHeaderImageContainer(orientation),
                      ),
                      Positioned(
                        top: isLoginScreen ? 30.h : 22.h,
                        left: 0,
                        right: 0,
                        child: buildInputContainer(orientation),
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          child: buildHeaderImageContainer(orientation),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: isLoginScreen
                                  ? SizeConfig.screenHeight * .6
                                  : SizeConfig.screenHeight * .6,
                              bottom: SizeConfig.defaultSize * 2),
                          child: buildInputContainer(orientation),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }

  Column buildInputContainer(Orientation orientation) {
    return Column(
      children: [
        Container(
          width: orientation == Orientation.portrait
              ? 90.w
              : SizeConfig.screenWidth * .8,
          padding: EdgeInsets.all(orientation == Orientation.portrait
              ? 4.w
              : SizeConfig.defaultSize * 2),
          decoration: BoxDecoration(
            color: ColorPalette.whiteColor,
            borderRadius: BorderRadius.circular(
                orientation == Orientation.portrait
                    ? 4.5.w
                    : SizeConfig.defaultSize * 1.5),
            boxShadow: [
              BoxShadow(
                color: ColorPalette.shadowColor,
                blurRadius: orientation == Orientation.portrait
                    ? 4.5.w
                    : SizeConfig.defaultSize * 1.5,
                spreadRadius: orientation == Orientation.portrait
                    ? 1.w
                    : SizeConfig.defaultSize * .5,
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
                            fontSize: orientation == Orientation.portrait
                                ? 3.5.w
                                : SizeConfig.defaultSize * 1.6,
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
                            fontSize: orientation == Orientation.portrait
                                ? 3.5.w
                                : SizeConfig.defaultSize * 1.6,
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
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    top: orientation == Orientation.portrait
                        ? 1.8.h
                        : SizeConfig.defaultSize * 2),
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
                                  style:
                                      TextStyle(color: ColorPalette.textColor1),
                                ),
                              ),
                              SizedBox(
                                width: orientation == Orientation.portrait
                                    ? 6.w
                                    : SizeConfig.defaultSize * 3,
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
                                      right: orientation == Orientation.portrait
                                          ? 3.5.w
                                          : SizeConfig.defaultSize),
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
                                  style:
                                      TextStyle(color: ColorPalette.textColor1),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    Container(
                      width: orientation == Orientation.portrait
                          ? 60.w
                          : SizeConfig.defaultSize * 40,
                      margin: EdgeInsets.only(
                          top: orientation == Orientation.portrait
                              ? 1.5.h
                              : SizeConfig.defaultSize * 2),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: orientation == Orientation.portrait
                              ? "By clicking 'Submit' you agree \nto our "
                              : "By clicking 'Submit' you agree to our ",
                          style:
                              const TextStyle(color: ColorPalette.textColor2),
                          children: const [
                            TextSpan(
                              // recognizer: ,
                              text: "terms & conditions",
                              style: TextStyle(color: ColorPalette.yellowColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        height: orientation == Orientation.portrait
                            ? 1.5.h
                            : SizeConfig.defaultSize * 2),
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
        if (!isLoginScreen)
          Column(
            children: [
              SizedBox(
                  height: orientation == Orientation.portrait
                      ? 2.5.h
                      : SizeConfig.defaultSize * 3),
              const Text(
                "or Signup with",
                style: TextStyle(
                  color: ColorPalette.lightCyan,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                  height: orientation == Orientation.portrait
                      ? 1.5.h
                      : SizeConfig.defaultSize * 2),
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
      ],
    );
  }

  Container buildHeaderImageContainer(Orientation orientation) {
    return Container(
      height: orientation == Orientation.portrait
          ? 38.h
          : SizeConfig.defaultSize * 42,
      width: SizeConfig.screenWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/assets/images/travel_bg.jpg"),
            fit: BoxFit.fill),
      ),
      child: Container(
        padding: orientation == Orientation.portrait
            ? EdgeInsets.only(top: 11.h, left: 4.w)
            : EdgeInsets.only(
                top: SizeConfig.defaultSize * 12,
                left: SizeConfig.defaultSize * SizeConfig.defaultSize),
        color: ColorPalette.lightCyan.withOpacity(.75),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Welcome to",
                style: TextStyle(
                  fontSize: orientation == Orientation.portrait
                      ? 6.w
                      : SizeConfig.defaultSize * 2.5,
                  color: ColorPalette.yellowColor,
                ),
                children: [
                  TextSpan(
                    text: " Travellers BD",
                    style: TextStyle(
                      fontSize: orientation == Orientation.portrait
                          ? 6.w
                          : SizeConfig.defaultSize * 2.5,
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.yellowColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: orientation == Orientation.portrait
                    ? 1.h
                    : SizeConfig.defaultSize),
            Text(
              isLoginScreen ? "Login to Continue" : "Sign up to Continue",
              style: const TextStyle(
                color: ColorPalette.whiteColor,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
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
      padding: EdgeInsets.only(bottom: 1.5.h),
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
            contentPadding: EdgeInsets.all(2.w),
            hintText: hintText,
            hintStyle:
                TextStyle(fontSize: 3.5.w, color: ColorPalette.textColor1)),
      ),
    );
  }
}
