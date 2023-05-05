import 'package:ecommerceapp/appColors/app_colors.dart';
import 'package:ecommerceapp/screens/homepage/home_page.dart';
import 'package:ecommerceapp/styles/login_screen_styles.dart';
import 'package:ecommerceapp/widgets/my_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../routes/routes.dart';
import '../../signup/signup_screen.dart';
import '../../svgimages/svg_images.dart';
import '../../widgets/my_textfromfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget buildTopPart(BuildContext context) {
    return Column(
      children: [
        //Text("Shopahol"),
        Image.asset(
          "images/logo.png",
          height: 150,
        ),
        Column(
          children: [
            MyTextFromField(
              hintText: "E-mail",
              obscureText: false,
            ),
            MyTextFromField(
              hintText: "Password",
              obscureText: true,
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: MyButtonWidget(
                  text: "Sign in",
                  color: const Color(0xff645CBB),
                  onPress: () {
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: const HomePage(),
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: MyButtonWidget(
                  text: "Sign up",
                  color: const Color(0xff645CBB),
                  onPress: () {
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: const SignupScreen(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Forgot password?",
          style: LoginScreenStyles.forgotPasswordStyles,
        ),
      ],
    );
  }

  Widget buildSocialButton(
      {required Widget child, required VoidCallback onPressed}) {
    return MaterialButton(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Colors.blueGrey.shade300,
            width: 1,
          )),
      onPressed: onPressed,
      child: child,
    );
  }

  Widget buildBottomPart() {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            "Sign in with social networks",
            style: LoginScreenStyles.signinSocialStyles,
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //facebook social button
                buildSocialButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.facebook,
                    color: Colors.black54,
                    width: 45,
                  ),
                ),
                //google social button
                buildSocialButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.google,
                    color: Colors.black54,
                    width: 45,
                  ),
                ),

                //twitter social button
                buildSocialButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.twitter,
                    color: Colors.black54,
                    width: 45,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 20),
            child: MaterialButton(
              color: AppColors.baseBlackColor,
              height: 55,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              child: Center(
                child: Text(
                  "Sign Up",
                  style: LoginScreenStyles.signupSocialStyles.copyWith(
                    color: AppColors.baseWhiteColor,
                  ),
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE3F6FF),
      body: SafeArea(
          child: Center(
              child:
                  ListView(physics: const BouncingScrollPhysics(), children: [
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          buildTopPart(context),
          buildBottomPart(),
        ])
      ]))),
    );
  }
}
