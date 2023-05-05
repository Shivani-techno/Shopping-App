import 'package:ecommerceapp/data/category_screen_data.dart';
import 'package:ecommerceapp/data/home_page_data.dart';
import 'package:ecommerceapp/models/category_product_model.dart';
import 'package:ecommerceapp/routes/routes.dart';
import 'package:ecommerceapp/screens/category/sub_category.dart';
import 'package:ecommerceapp/widgets/category_product_widget.dart';
import 'package:flutter/material.dart';

class CategoryMenTabBar extends StatelessWidget {
  final List<CategoryProductModel> categoryProductModel;
  const CategoryMenTabBar({super.key, required this.categoryProductModel});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        var data = categoryProductModel[index];
        return CategoryProductWidget(
          onPressed: () {
            if (index == 0) {
              PageRouting.goToNextPage(
                context: context,
                navigateTo: SubCategory(
                  productData: clothesData,
                  productModel: clothesData[index].productModel,
                  productName: menCategoryData[index].productName,
                ),
              );
            } else if (index == 1) {
              PageRouting.goToNextPage(
                context: context,
                navigateTo: SubCategory(
                  productData: shoesData,
                  productModel: shoesData[index].productModel,
                  productName: menCategoryData[index].productName,
                ),
              );
            } else if (index == 2) {
              PageRouting.goToNextPage(
                context: context,
                navigateTo: SubCategory(
                  productData: accessoriesData,
                  productModel: accessoriesData[index].productModel,
                  productName: menCategoryData[index].productName,
                ),
              );
            } else if (index == 3) {
              PageRouting.goToNextPage(
                context: context,
                navigateTo: SubCategory(
                  productData: accessoriesData,
                  productModel: accessoriesData[index].productModel,
                  productName: menCategoryData[index].productName,
                ),
              );
            } else if (index == 4) {
              PageRouting.goToNextPage(
                context: context,
                navigateTo: SubCategory(
                  productData: accessoriesData,
                  productModel: accessoriesData[index].productModel,
                  productName: menCategoryData[index].productName,
                ),
              );
            }
          },
          productImage: data.productImage,
          productModel: data.productModel,
          productName: data.productName,
        );
      },
      itemCount: categoryProductModel.length,
    );
  }
}
