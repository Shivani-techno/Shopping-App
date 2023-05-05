import 'package:ecommerceapp/appColors/app_colors.dart';
import 'package:ecommerceapp/routes/routes.dart';
import 'package:ecommerceapp/styles/detail_screen_styles.dart';
import 'package:ecommerceapp/svgimages/svg_images.dart';
import 'package:ecommerceapp/widgets/my_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../payment/payment_screen.dart';

class YourBagScreen extends StatefulWidget {
  const YourBagScreen({super.key});

  @override
  State<YourBagScreen> createState() => _YoutBagState();
}

class _YoutBagState extends State<YourBagScreen> {
  String sizeController = "M";
  String colorController = "red";
  String quantityController = "1";
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xffE3F6FF),
      elevation: 1,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            SvgImages.delete,
            color: AppColors.baseBlackColor,
            width: 40,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            SvgImages.search,
            color: AppColors.baseBlackColor,
            width: 40,
          ),
        ),
      ],
    );
  }

  Widget buildSingleBag() {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.network(
                      'https://assets.ajio.com/medias/sys_master/root/20221109/xg7d/636b8e9af997ddfdbd663e62/-473Wx593H-461119105-blue-MODEL2.jpg',
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
                        const Text(
                          "3 stripes Shirt",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.baseBlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Adidas original",
                          style: TextStyle(
                            color: AppColors.baseDarkPinkColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
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
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.baseGrey30Color,
                      child: Icon(
                        Icons.check,
                        color: AppColors.baseWhiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      fillColor: AppColors.baseWhiteColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    hint: const Text(
                      "Size",
                      style: DetailScreenStyles.productDropDownValueStyle,
                    ),
                    value: sizeController,
                    items: ["M", "L", "S", "XL"]
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        sizeController = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      fillColor: AppColors.baseWhiteColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    hint: const Text(
                      "Colors",
                      style: DetailScreenStyles.productDropDownValueStyle,
                    ),
                    value: colorController,
                    items: ["red", "yellow", "green", "blue"]
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        colorController = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  fillColor: AppColors.baseWhiteColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                hint: const Text(
                  "Quantity",
                  style: DetailScreenStyles.productDropDownValueStyle,
                ),
                value: quantityController,
                items: ["1", "2", "3", "4"]
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    quantityController = value!;
                  });
                },
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
      appBar: buildAppBar(),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your bag",
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColors.baseBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "You have 3 items in your bag",
                  style: TextStyle(
                    color: AppColors.baseGrey60Color,
                  ),
                ),
                buildSingleBag(),
                buildSingleBag(),
                buildSingleBag(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.only(
                            right: 20,
                          ),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: AppColors.basewhite60Color,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text(
                            "21223345",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.baseBlackColor,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          elevation: 1,
                          height: 40,
                          color: AppColors.baseLightOrangeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                            side: BorderSide.none,
                          ),
                          child: const Text(
                            "Employee",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.basewhite60Color,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Order amount",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.baseBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Your total amount of discount",
                        style: TextStyle(
                          color: AppColors.baseBlackColor,
                        ),
                      ),
                    ],
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "\$103.00",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.baseBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "\$-55.98.00",
                        style: TextStyle(
                          color: AppColors.baseBlackColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: MyButtonWidget(
                    color: AppColors.baseDarkPinkColor,
                    text: "Checkout",
                    onPress: () {
                      PageRouting.goToNextPage(
                        context: context,
                        navigateTo: const PaymentScreen(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
