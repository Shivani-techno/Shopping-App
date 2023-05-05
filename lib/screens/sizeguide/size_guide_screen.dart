import 'package:ecommerceapp/appColors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../styles/detail_screen_styles.dart';

class SizeGuideScreen extends StatefulWidget {
  const SizeGuideScreen({super.key});

  @override
  State<SizeGuideScreen> createState() => _SizeGuideScreenState();
}

class _SizeGuideScreenState extends State<SizeGuideScreen> {
  final String _genderController = "Woman";

  Widget buildTableRowText({required String text}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  TableRow buildTableRow({
    required List<Widget> children,
  }) {
    return TableRow(
      decoration: BoxDecoration(
        color: AppColors.basewhite60Color,
        border: Border.all(
          color: AppColors.baseGrey30Color,
        ),
      ),
      children: children,
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

  AppBar buildAppBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: const Color(0xffE3F6FF),
      centerTitle: true,
      title: const Text(
        "Size Guide",
        style: TextStyle(
          color: AppColors.baseBlackColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.info_outline,
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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Gender",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.baseBlackColor,
                  ),
                ),
                buildExpansionTile(
                  items: [
                    "Woman",
                    "Man",
                    "Kids",
                  ],
                  title: "Gender",
                  hint: "Gender",
                  value: _genderController,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
              },
              border: TableBorder.all(
                color: AppColors.baseGrey30Color,
                width: 2,
              ),
              children: [
                buildTableRow(
                  children: [
                    buildTableRowText(
                      text: "IND",
                    ),
                    buildTableRowText(
                      text: "US",
                    ),
                    buildTableRowText(
                      text: "Eu",
                    ),
                    buildTableRowText(
                      text: "JP",
                    ),
                  ],
                ),
                buildTableRow(
                  children: [
                    buildTableRowText(
                      text: "5",
                    ),
                    buildTableRowText(
                      text: "4.5",
                    ),
                    buildTableRowText(
                      text: "6",
                    ),
                    buildTableRowText(
                      text: "10",
                    ),
                  ],
                ),
                buildTableRow(
                  children: [
                    buildTableRowText(
                      text: "5.5",
                    ),
                    buildTableRowText(
                      text: "3.5",
                    ),
                    buildTableRowText(
                      text: "6.5",
                    ),
                    buildTableRowText(
                      text: "12",
                    ),
                  ],
                ),
                buildTableRow(
                  children: [
                    buildTableRowText(
                      text: "6.5",
                    ),
                    buildTableRowText(
                      text: "2.5",
                    ),
                    buildTableRowText(
                      text: "5.5",
                    ),
                    buildTableRowText(
                      text: "12.5",
                    ),
                  ],
                ),
                buildTableRow(
                  children: [
                    buildTableRowText(
                      text: "7",
                    ),
                    buildTableRowText(
                      text: "7.5",
                    ),
                    buildTableRowText(
                      text: "8",
                    ),
                    buildTableRowText(
                      text: "20",
                    ),
                  ],
                ),
                buildTableRow(
                  children: [
                    buildTableRowText(
                      text: "8",
                    ),
                    buildTableRowText(
                      text: "7",
                    ),
                    buildTableRowText(
                      text: "9",
                    ),
                    buildTableRowText(
                      text: "30",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColors.basewhite60Color,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "In between sizes?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.baseBlackColor,
                  ),
                ),
                Wrap(
                  children: const [
                    Text(
                      "For tight fit,\t go one size down.\n for loose fit, \tgo one size up",
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.baseBlackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
