import 'package:ecommerceapp/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class SingleProductWidget extends StatelessWidget {
  // const SingleProductWidget({super.key});

  final String productName;
  final String productImage;
  final String productModel;
  final double productPrice;
  final double productOldPrice;
  final VoidCallback onPressed;

  const SingleProductWidget({
    super.key,
    required this.onPressed,
    required this.productImage,
    required this.productModel,
    required this.productName,
    required this.productOldPrice,
    required this.productPrice,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              width: double.infinity,
              color: Colors.transparent,
              child: Image.network(
                productImage,
                fit: BoxFit.cover,
              ),
            )),
            // Expanded(
            //   child: Container(
            //     alignment: Alignment.topRight,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       color: AppColors.baseGrey10Color,
            //       borderRadius: BorderRadius.circular(10),
            //       image: DecorationImage(
            //         fit: BoxFit.cover,
            //         image: NetworkImage(productImage),
            //       ),
            //     ),
            //     child: IconButton(
            //       onPressed: () {},
            //       icon: const Icon(
            //         Icons.favorite,
            //         size: 30,
            //         color: AppColors.baseDarkOrangeColor,
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    productName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    productModel,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.baseDarkPinkColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(
                          "\$ $productPrice",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "\$ $productOldPrice",
                          softWrap: true,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
