import 'package:ecommerceapp/models/single_product_model.dart';
import 'package:ecommerceapp/routes/routes.dart';
import 'package:ecommerceapp/screens/detailscreen/detail_screen.dart';
import 'package:ecommerceapp/svgimages/svg_images.dart';
import 'package:ecommerceapp/widgets/single_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../appColors/app_colors.dart';
import '../../styles/sub_category_style.dart';

class SubCategory extends StatefulWidget {
  final List<SingleProductModel> productData;
  final String productName;
  final String productModel;
  const SubCategory({
    super.key,
    required this.productData,
    required this.productModel,
    required this.productName,
  });

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  int isSelect = 1;

  List<bool> isSelected = [true, false, false];

  FocusNode focusNodeButton1 = FocusNode();

  FocusNode focusNodeButton2 = FocusNode();

  FocusNode focusNodeButton3 = FocusNode();

  List<FocusNode> focusToggle = [];

  @override
  void initState() {
    focusToggle = [
      focusNodeButton1,
      focusNodeButton2,
      focusNodeButton3,
    ];
    super.initState();
  }

  @override
  void dispose() {
    focusNodeButton1.dispose();
    focusNodeButton2.dispose();
    focusNodeButton3.dispose();

    super.dispose();
  }

  Widget buildToggleButton() {
    return ToggleButtons(
      borderWidth: 0,
      focusColor: null,
      fillColor: Colors.transparent,
      selectedColor: AppColors.baseDarkPinkColor,
      disabledColor: AppColors.baseBlackColor,
      selectedBorderColor: Colors.transparent,
      borderColor: Colors.transparent,
      focusNodes: focusToggle,
      onPressed: (int index) {
        if (index == 0) {
          setState(() {
            isSelect = 1;
          });
        } else if (index == 1) {
          setState(() {
            isSelect = 2;
          });
        } else if (index == 2) {
          setState(() {
            isSelect = 3;
          });
        }
        setState(() {
          for (int buttonIndex = 0;
              buttonIndex < isSelected.length;
              buttonIndex++) {
            if (buttonIndex == index) {
              isSelected[buttonIndex] = true;
            } else {
              isSelected[buttonIndex] = false;
            }
          }
        });
      },
      isSelected: isSelected,
      children: const [
        Icon(
          Icons.grid_view,
          size: 25,
        ),
        Icon(
          Icons.view_agenda_outlined,
          size: 25,
        ),
        Icon(
          Icons.crop_landscape_sharp,
          size: 25,
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xffE3F6FF),
      actions: [
        IconButton(
          onPressed: () {},
          icon: RotationTransition(
            turns: const AlwaysStoppedAnimation(90 / 360),
            child: SvgPicture.asset(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productName,
                  style: SubCategoryStyle.subCategoryTitleStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${widget.productData.length}Products",
                  style: SubCategoryStyle.subCategoryProductItemStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.list_alt_sharp,
                            color: AppColors.baseBlackColor,
                            size: 25,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.productModel,
                            style: SubCategoryStyle.subCategoryModelStyle,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildToggleButton(),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: widget.productData.length,
                  primary: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isSelect == 1
                        ? 2
                        : isSelect == 2
                            ? 1
                            : isSelect == 3
                                ? 1
                                : 2,
                    childAspectRatio: isSelect == 1
                        ? 0.7
                        : isSelect == 2
                            ? 1.5
                            : isSelect == 3
                                ? 0.8
                                : 0.7,
                  ),
                  itemBuilder: (context, index) {
                    var data = widget.productData[index];
                    return SingleProductWidget(
                      onPressed: () {
                        PageRouting.goToNextPage(
                          context: context,
                          navigateTo: DetailScreen(
                            data: data,
                          ),
                        );
                      },
                      productImage: data.productImage,
                      productModel: data.productModel,
                      productName: data.productName,
                      productOldPrice: data.productOldPrice,
                      productPrice: data.productPrice,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
