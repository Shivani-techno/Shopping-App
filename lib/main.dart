import 'package:ecommerceapp/appColors/app_colors.dart';
import 'package:ecommerceapp/mybottombar/my_bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: AppColors.baseBlackColor,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      // home: PaymentScreen(),
      home: const MyBottomBar(),
      // home: const MyBottomBar(),
      // routes: {
      //   SignupScreen.routeName: (context) => const SignupScreen(),
      // },
    );
  }
}
