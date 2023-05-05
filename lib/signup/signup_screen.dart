import 'package:ecommerceapp/appColors/app_colors.dart';
import 'package:ecommerceapp/routes/routes.dart';
import 'package:ecommerceapp/signup/signup_screen_styles.dart';
import 'package:ecommerceapp/styles/login_screen_styles.dart';
import 'package:ecommerceapp/svgimages/svg_images.dart';
import 'package:ecommerceapp/widgets/my_button_widget.dart';
import 'package:ecommerceapp/widgets/my_textfromfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatelessWidget {
  // static const routeName = "/signup";
  const SignupScreen({super.key});

  Widget buildTopPart() {
    return Column(
      children: [
        SizedBox(
          child: Image.asset(
            "images/logo.png",
            height: 190,
            alignment: Alignment.topLeft,
          ),
        ),
        MyTextFromField(
          hintText: "Full Name",
          obscureText: false,
        ),
        MyTextFromField(
          hintText: "E-mail",
          obscureText: false,
        ),
        MyTextFromField(
          hintText: "Password",
          obscureText: true,
        ),
        MyTextFromField(
          hintText: "Confirm Password",
          obscureText: true,
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: MyButtonWidget(
            onPress: () {},
            color: AppColors.baseDarkPinkColor,
            text: "Create an accont",
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
          text: const TextSpan(
            text: "By signing up you agree to our\n\t",
            style: SignupScreenStyles.signInAgressStyle,
            children: <TextSpan>[
              TextSpan(
                text: "Terms ",
                style: SignupScreenStyles.termsTextStyle,
              ),
              TextSpan(
                text: "and\t ",
                style: SignupScreenStyles.andTextStyle,
              ),
              TextSpan(
                text: "Condtions of use",
                style: SignupScreenStyles.conditionsofUseTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSocialButton(
      {required Widget child, required VoidCallback onPressed}) {
    return MaterialButton(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 130, 28, 255),
            width: 1,
          )),
      onPressed: onPressed,
      child: child,
    );
  }

  Widget buildBottomPart({required BuildContext context}) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            "or sign with social networks",
            style: SignupScreenStyles.signinsocialStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildSocialButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.facebook,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  ),
                ),
                buildSocialButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.google,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  ),
                ),
                buildSocialButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.twitter,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: MaterialButton(
              onPressed: () {
                PageRouting.goToNextPage(
                  context: context,
                  navigateTo: const SignupScreen(),
                );
              },
              color: Colors.brown[300],
              height: 55,
              elevation: 4,
              child: const Center(
                child: Text(
                  "Sign Up",
                  style: LoginScreenStyles.signupbuttontextStyles,
                ),
              ),
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
      appBar: AppBar(
        elevation: 2,
        backgroundColor: const Color(0xffE8E2E2),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            buildTopPart(),
            buildBottomPart(context: context),
          ],
        ),
      ),
    );
  }
}
