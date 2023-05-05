import 'package:ecommerceapp/models/single_product_model.dart';
import 'package:ecommerceapp/routes/routes.dart';
import 'package:ecommerceapp/screens/detailscreen/detail_screen.dart';
import 'package:ecommerceapp/widgets/single_product_widget.dart';
import 'package:flutter/material.dart';

import '../../data/home_page_data.dart';

class ShowAllScreen extends StatefulWidget {
  const ShowAllScreen({super.key});

  @override
  State<ShowAllScreen> createState() => _ShowAllScreenState();
}

class _ShowAllScreenState extends State<ShowAllScreen> {
  List<SingleProductModel> products = [];

  List<SingleProductModel> getData() {
    products.addAll(singleProductData);
    products.addAll(clothesData);
    products.addAll(shoesData);
    products.addAll(accessoriesData);
    return products;
  }

  @override
  void initState() {
    super.initState();
    products = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Products",
          textScaleFactor: 1,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xffE3F6FF),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return SingleProductWidget(
            onPressed: () {
              PageRouting.goToNextPage(
                context: context,
                navigateTo: DetailScreen(
                  data: products[index],
                ),
              );
            },
            productImage: products[index].productImage,
            productModel: products[index].productModel,
            productName: products[index].productName,
            productOldPrice: products[index].productOldPrice,
            productPrice: products[index].productPrice,
          );
        },
      ),
    );
  }
}
