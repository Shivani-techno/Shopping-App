import 'package:ecommerceapp/styles/detail_screen_styles.dart';
import 'package:ecommerceapp/widgets/my_button_widget.dart';
import 'package:flutter/material.dart';

import '../../appColors/app_colors.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  AppBar buildAppBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: const Color(0xffE3F6FF),
      centerTitle: true,
      title: const Text(
        "Filter",
        style: TextStyle(
          color: AppColors.baseBlackColor,
        ),
      ),
    );
  }

  Widget buildExpansionTile({
    required List<String> items,
    required String title,
    required String hint,
    required String value,
  }) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.baseBlackColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField(
                decoration: InputDecoration(
                  fillColor: AppColors.baseWhiteColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                iconSize: 30,
                hint: Text(
                  hint,
                  style: DetailScreenStyles.productDropDownValueStyle,
                ),
                value: value,
                items: items
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(
                    () {
                      value = value!;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildListTile({required String title}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.baseBlackColor,
        ),
      ),
    );
  }

  Widget buildSizeGuides({
    String text = "",
    bool containerColor = false,
    Color color = AppColors.baseGrey10Color,
  }) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: containerColor ? color : AppColors.baseGrey10Color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: containerColor
          ? Container()
          : Text(
              text,
              style: const TextStyle(
                color: AppColors.baseBlackColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }

  Widget buildPriceExpansionTile() {
    return ExpansionTile(
      title: const Text(
        "Price",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.baseBlackColor,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              RangeSlider(
                values: _currentRangeValues,
                min: 0,
                max: 1000,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$\t${_currentRangeValues.start.toInt()}",
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.baseBlackColor,
                    ),
                  ),
                  Text(
                    "\$\t${_currentRangeValues.end.toInt()}",
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.baseBlackColor,
                    ),
                  ),
                ],
              ),
            ],
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
        physics: const BouncingScrollPhysics(),
        children: [
          buildListTile(title: "Most Popular"),
          const Divider(),
          buildListTile(title: "New items"),
          const Divider(),
          buildListTile(title: "Price:\t High - Low"),
          const Divider(),
          buildListTile(title: "Price:\t Low - High"),
          const Divider(),
          ExpansionTile(
            title: const Text(
              "Category",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.baseBlackColor,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  primary: true,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    buildSizeGuides(
                      text: "Men",
                      containerColor: false,
                    ),
                    buildSizeGuides(
                      text: "Women",
                      containerColor: false,
                    ),
                    buildSizeGuides(
                      text: "Kids",
                      containerColor: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          ExpansionTile(
            title: const Text(
              "Category",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.baseBlackColor,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  primary: true,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    buildSizeGuides(
                      text: "Jackets",
                      containerColor: false,
                    ),
                    buildSizeGuides(
                      text: "T-Shirts",
                      containerColor: false,
                    ),
                    buildSizeGuides(
                      text: "Sneakers",
                      containerColor: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          ExpansionTile(
            title: const Text(
              "Size",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.baseBlackColor,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 5,
                  primary: true,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    buildSizeGuides(
                      text: "5",
                      containerColor: false,
                    ),
                    buildSizeGuides(
                      text: "5.5",
                      containerColor: false,
                    ),
                    buildSizeGuides(
                      text: "6",
                      containerColor: false,
                    ),
                    buildSizeGuides(
                      text: "6.5",
                      containerColor: false,
                    ),
                    buildSizeGuides(
                      text: "7",
                      containerColor: false,
                    ),
                    buildSizeGuides(
                      text: "8",
                      containerColor: false,
                    ),
                    buildSizeGuides(
                      text: "8.5",
                      containerColor: false,
                    ),
                    buildSizeGuides(
                      text: "9",
                      containerColor: false,
                    ),
                    buildSizeGuides(
                      text: "9.5",
                      containerColor: false,
                    ),
                    buildSizeGuides(
                      text: "10",
                      containerColor: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          ExpansionTile(
            title: const Text(
              "Colors",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.baseBlackColor,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 5,
                  primary: true,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    buildSizeGuides(
                      color: AppColors.baseDarkPinkColor,
                      containerColor: true,
                    ),
                    buildSizeGuides(
                      color: AppColors.baseBlackColor,
                      containerColor: true,
                    ),
                    buildSizeGuides(
                      color: AppColors.baseDarkOrangeColor,
                      containerColor: true,
                    ),
                    buildSizeGuides(
                      color: AppColors.baseLightCyanColor,
                      containerColor: true,
                    ),
                    buildSizeGuides(
                      color: AppColors.baseGrey70Color,
                      containerColor: true,
                    ),
                    buildSizeGuides(
                      color: AppColors.baseDarkGreenColor,
                      containerColor: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
          buildPriceExpansionTile(),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: MyButtonWidget(
              color: AppColors.baseDarkPinkColor,
              onPress: () {},
              text: "View more items",
            ),
          )
        ],
      ),
    );
  }
}
