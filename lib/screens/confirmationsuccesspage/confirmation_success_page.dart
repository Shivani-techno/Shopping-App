import 'package:ecommerceapp/appColors/app_colors.dart';
import 'package:ecommerceapp/screens/homepage/home_page.dart';
import 'package:ecommerceapp/widgets/my_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../routes/routes.dart';

class ConfirmationSuccessPage extends StatelessWidget {
  const ConfirmationSuccessPage({super.key});

  AppBar buildAppbar() {
    return AppBar(
      centerTitle: true,
      elevation: 1,
      backgroundColor: const Color(0xffE3F6FF),
      title: const Text(
        "Success",
        style: TextStyle(
          color: AppColors.baseBlackColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "SvgImages.close",
            width: 30,
            color: AppColors.baseBlackColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        Text(
                          "Congratulations",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppColors.baseBlackColor,
                          ),
                        ),
                        Text(
                          "Your order is accepted",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppColors.baseBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        Text(
                          "Your items are on the way",
                          style: TextStyle(
                            color: AppColors.baseGrey40Color,
                          ),
                        ),
                        Text(
                          "Arriving shortly",
                          style: TextStyle(
                            color: AppColors.baseGrey40Color,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: MyButtonWidget(
              onPress: () {
                PageRouting.goToNextPage(
                  context: context,
                  navigateTo: const HomePage(),
                );
              },
              color: AppColors.baseDarkPinkColor,
              text: "Back to Home",
            ),
          ),
        ],
      ),
    );
  }
}
