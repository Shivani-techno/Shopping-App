import 'package:ecommerceapp/appColors/app_colors.dart';
import 'package:ecommerceapp/models/single_product_model.dart';
import 'package:ecommerceapp/screens/showAll/show_all_screen.dart';
import 'package:ecommerceapp/svgimages/svg_images.dart';
import 'package:ecommerceapp/screens/sizeguide/size_guide_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/home_page_data.dart';
import '../../routes/routes.dart';
import '../../styles/detail_screen_styles.dart';
import '../../widgets/single_product_widget.dart';

class DetailScreen extends StatefulWidget {
  //const DetailScreen({super.key});
  final SingleProductModel data;

  const DetailScreen({super.key, required this.data});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String? ratingController;
  String? sizeController;
  List<String> colors = ["Red", "Blue", "Green", "Yellow", "pink"];
  List<String> sizes = ["25", "30", "35", "40", "45"];

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: AppBar(
        backgroundColor: const Color(0xffE3F6FF),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Reebok",
          style: TextStyle(color: AppColors.baseBlackColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgImages.heart,
              color: AppColors.baseBlackColor,
              width: 35,
              semanticsLabel: "Fave",
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgImages.upload,
              color: AppColors.baseBlackColor,
              width: 35,
              semanticsLabel: "Fave",
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 35,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(
                "images/logo.png",
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data.productName,
                  style: DetailScreenStyles.companytitleStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.data.productModel,
                  style: DetailScreenStyles.productModelStyle,
                )
              ],
            ),
            trailing: Column(
              children: [
                Text(
                  widget.data.productPrice.toString(),
                  style: DetailScreenStyles.productPriceStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.data.productOldPrice.toString(),
                  style: DetailScreenStyles.productOldPriceStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    widget.data.productImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 15, top: 15),
                        child: Image.network(widget.data.productSecondImage),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 15, top: 15),
                        child: Image.network(widget.data.productThirdImage),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 15, top: 15),
                        child: Image.network(widget.data.productFourImage),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        ratingController = value;
                      });
                    },
                    hint: const Text("Color"),
                    items: colors
                        .map(
                          (color) => DropdownMenuItem(
                            value: color,
                            child: Text(
                              color,
                            ),
                          ),
                        )
                        .toList(),
                    value: ratingController ?? "Red",
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        sizeController = value;
                      });
                    },
                    hint: const Text("Size"),
                    items: sizes
                        .map(
                          (size) => DropdownMenuItem(
                            value: size,
                            child: Text(
                              size,
                            ),
                          ),
                        )
                        .toList(),
                    value: sizeController ?? "25",
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MaterialButton(
              elevation: 0,
              height: 50,
              color: AppColors.baseDarkGreenColor,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide.none,
              ),
              child: const Text(
                "Add to Cart",
                style: DetailScreenStyles.buttonTextStyle,
              ),
            ),
          ),
          ExpansionTile(
            title: const Text(
              "Description",
              style: DetailScreenStyles.descriptionTextStyle,
            ),
            children: [
              ListTile(
                title: Wrap(
                  children: [
                    const Text(
                        "this woman's tank top is designed to help you\nstay confident",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              ".\t\tMaterial",
                              style: TextStyle(
                                fontSize: 18.60,
                              ),
                            ),
                            Text(
                              "84%\tnylon",
                              style: TextStyle(
                                fontSize: 18.60,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "16% elastance",
                              style: TextStyle(
                                fontSize: 18.60,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              ".\t\tProvince",
                              style: TextStyle(
                                fontSize: 18.60,
                              ),
                            ),
                            Text(
                              "India",
                              style: TextStyle(
                                fontSize: 18.60,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              ".\t\tCountry",
                              style: TextStyle(
                                fontSize: 18.60,
                              ),
                            ),
                            Text(
                              "Germany",
                              style: TextStyle(
                                fontSize: 18.60,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          onPressed: () {
                            PageRouting.goToNextPage(
                              context: context,
                              navigateTo: const SizeGuideScreen(),
                            );
                          },
                          height: 55,
                          elevation: 0,
                          minWidth: double.infinity,
                          color: AppColors.basewhite60Color,
                          child: const Text(
                            "Size Guide",
                            style: DetailScreenStyles.sizeGuideTextStyle,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          ListTile(
            leading: const Text(
              "You may also like",
              style: DetailScreenStyles.youmayalsolikeTextStyle,
            ),
            trailing: TextButton(
              onPressed: () {
                PageRouting.goToNextPage(
                  context: context,
                  navigateTo: const ShowAllScreen(),
                );
              },
              child: const Text(
                "Show All",
                style: DetailScreenStyles.showallTextStyle,
              ),
            ),
          ),
          SizedBox(
            height: 240,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: singleProductData.length,
              primary: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (context, index) {
                var data = singleProductData[index];
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
          ),
        ],
      ),
    );
  }
}
