import 'package:ecommerceapp/data/category_screen_data.dart';
import 'package:ecommerceapp/routes/routes.dart';
import 'package:ecommerceapp/screens/detailscreen/detail_screen.dart';
import 'package:ecommerceapp/widgets/show_all_widget.dart';
import 'package:ecommerceapp/widgets/single_product_widget.dart';
import 'package:flutter/material.dart';

import '../../models/single_product_model.dart';

class CategoryAllTabBar extends StatelessWidget {
  const CategoryAllTabBar({super.key});

  Widget builderRender({required List<SingleProductModel> singleProduct}) {
    return SizedBox(
      height: 250,
      child: GridView.builder(
        itemCount: singleProduct.length,
        shrinkWrap: true,
        primary: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.4,
        ),
        itemBuilder: (context, index) {
          var data = singleProduct[index];
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const ShowAllWidget(
          leftText: "Clothing",
        ),
        builderRender(
          singleProduct: categoryClothData,
        ),
        const ShowAllWidget(
          leftText: "Shoes",
        ),
        builderRender(
          singleProduct: categoryShoesData,
        ),
        const ShowAllWidget(
          leftText: "Accessories",
        ),
        builderRender(
          singleProduct: categoryAccessoriesData,
        ),
      ],
    );
  }
}
