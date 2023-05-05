import 'package:ecommerceapp/appColors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../widgets/my_button_widget.dart';
import '../confirmationsuccesspage/confirmation_success_page.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  AppBar buildAppbar() {
    return AppBar(
      elevation: 1,
      backgroundColor: const Color(0xffE3F6FF),
    );
  }

  Widget buildBottomPart(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: AppColors.baseGrey10Color,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Order amount",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.baseBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Your total amount of discount",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.baseBlackColor,
                  ),
                ),
              ],
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  "\$103.98",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.baseBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "\$-55.98",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.baseBlackColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: AppColors.baseGrey10Color,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 23),
          child: MyButtonWidget(
            color: AppColors.baseDarkPinkColor,
            text: "Place Order",
            onPress: () {
              PageRouting.goToNextPage(
                context: context,
                navigateTo: const ConfirmationSuccessPage(),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildConfirmationProduct() {
    return Card(
      child: SizedBox(
        height: 140,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://assets.ajio.com/medias/sys_master/root/20221109/xg7d/636b8e9af997ddfdbd663e62/-473Wx593H-461119105-blue-MODEL2.jpg"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "3 stripes Shirt",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.baseBlackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                " \$ 40",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.baseBlackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Adidas original",
                                style: TextStyle(
                                  color: AppColors.baseDarkPinkColor,
                                ),
                              ),
                              Text(
                                " \$ 80",
                                style: TextStyle(
                                  fontSize: 16,
                                  decoration: TextDecoration.lineThrough,
                                  color: AppColors.baseBlackColor,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Color: \t Black",
                            style: TextStyle(
                              color: AppColors.baseGrey60Color,
                              fontSize: 16,
                            ),
                          ),
                          const Text(
                            "Quantity\tx1",
                            style: TextStyle(
                              color: AppColors.baseGrey60Color,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      backgroundColor: AppColors.baseGrey10Color,
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            color: AppColors.baseWhiteColor,
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    "Confirmation",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.baseBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Order number #1234",
                  ),
                ),
                buildConfirmationProduct(),
                buildConfirmationProduct(),
                buildConfirmationProduct(),
                buildBottomPart(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
