import 'package:ecommerceapp/svgimages/svg_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../appColors/app_colors.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  bool isSelected = false;
  Widget buildSingleBag(int index) {
    return Dismissible(
      key: ValueKey(index),
      onDismissed: (direction) {},
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Card(
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
                        flex: 2,
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
                                "Adidas original",
                                style: TextStyle(
                                  color: AppColors.baseDarkPinkColor,
                                ),
                              ),
                              Text(
                                "\$40.00",
                                style: TextStyle(
                                  color: AppColors.baseBlackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "\$80.00",
                                style: TextStyle(
                                  color: AppColors.baseGrey50Color,
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: isSelected
                                ? Colors.green
                                : AppColors.baseGrey30Color,
                            child: const Icon(
                              Icons.check,
                              color: AppColors.baseWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xffE3F6FF),
      elevation: 1,
      centerTitle: true,
      title: const Text(
        "WishList",
        style: TextStyle(
          color: AppColors.baseBlackColor,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(
            right: 14.0,
            left: 14.0,
          ),
          child: Text(
            "Select",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.baseBlackColor,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 55,
                margin: const EdgeInsets.all(10.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: AppColors.baseDarkPinkColor,
                    foregroundColor: Colors.grey,
                  ),
                  icon: SvgPicture.asset(
                    SvgImages.cart,
                    color: AppColors.basewhite60Color,
                    width: 30,
                  ),
                  label: const Text(
                    "Buy Now",
                    style: TextStyle(
                        fontSize: 22, color: AppColors.baseWhiteColor),
                  ),
                  onLongPress: () {},
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: buildAppBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSingleBag(1),
                buildSingleBag(2),
                buildSingleBag(3),
                buildSingleBag(4),
                buildSingleBag(5),
                buildSingleBag(6),
                buildSingleBag(7),
                buildSingleBag(8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
