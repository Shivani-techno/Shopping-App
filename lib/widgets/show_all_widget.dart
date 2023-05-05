import 'package:ecommerceapp/appColors/app_colors.dart';
import 'package:ecommerceapp/routes/routes.dart';
import 'package:ecommerceapp/screens/showAll/show_all_screen.dart';
import 'package:flutter/material.dart';

class ShowAllWidget extends StatelessWidget {
  //const ShowAllWidget({super.key});
  final String leftText;
  const ShowAllWidget({super.key, required this.leftText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.baseBlackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {
              PageRouting.goToNextPage(
                context: context,
                navigateTo: const ShowAllScreen(),
              );
            },
            child: const Text(
              "Show All",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.baseDarkPinkColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
