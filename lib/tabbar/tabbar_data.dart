import 'package:ecommerceapp/models/single_product_model.dart';
import 'package:flutter/material.dart';
import '../data/home_page_data.dart';
import '../widgets/single_product_widget.dart';

class Tabbar extends StatelessWidget {
  final List<SingleProductModel> productData;

  const Tabbar({super.key, required this.productData});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      primary: true,
      itemCount: clothesData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        var data = productData[index];
        return SingleProductWidget(
          onPressed: () {},
          productImage: data.productImage,
          productModel: data.productModel,
          productName: data.productName,
          productOldPrice: data.productOldPrice,
          productPrice: data.productPrice,
        );
      },
    );
  }
}
