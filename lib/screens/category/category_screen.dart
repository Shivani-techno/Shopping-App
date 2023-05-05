import 'package:ecommerceapp/data/category_screen_data.dart';
import 'package:ecommerceapp/styles/category_screen_styles.dart';
import 'package:ecommerceapp/svgimages/svg_images.dart';
import 'package:ecommerceapp/tabbar/categorytabbar/category_all_tabbar.dart';
import 'package:ecommerceapp/tabbar/categorytabbar/category_men_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../appColors/app_colors.dart';

class CategoryScreenState extends StatefulWidget {
  const CategoryScreenState({super.key});

  @override
  State<CategoryScreenState> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreenState> {
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xffE3F6FF),
      elevation: 1.5,
      centerTitle: true,
      title: const Text(
        "Welcome",
        style: CategoryScreenStyles.categoryAppBarTitleStyle,
      ),
      actions: [
        RotationTransition(
          turns: const AlwaysStoppedAnimation(90 / 360),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgImages.setting,
              color: AppColors.baseBlackColor,
              width: 35,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            SvgImages.search,
            color: AppColors.baseBlackColor,
            width: 35,
          ),
        ),
      ],
      bottom: const TabBar(
        indicator: BoxDecoration(
          color: Colors.transparent,
        ),
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: AppColors.baseBlackColor,
        labelColor: AppColors.baseDarkPinkColor,
        automaticIndicatorColorAdjustment: false,
        tabs: [
          Text("All"),
          Text("Men"),
          Text("Women"),
          Text("Kids"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.baseWhiteColor,
        appBar: buildAppBar(),
        body: TabBarView(
          children: [
            //all place
            const CategoryAllTabBar(),
            //men place
            CategoryMenTabBar(
              categoryProductModel: menCategoryData,
            ),
            //women place
            CategoryMenTabBar(
              categoryProductModel: womenCategoryData,
            ),
            //kids place
            CategoryMenTabBar(
              categoryProductModel: forKids,
            ),
          ],
        ),
      ),
    );
  }
}
