import 'package:ecommerceapp/appColors/app_colors.dart';
import 'package:ecommerceapp/data/home_page_data.dart';
import 'package:ecommerceapp/models/single_product_model.dart';
import 'package:ecommerceapp/routes/routes.dart';
import 'package:ecommerceapp/screens/detailscreen/detail_screen.dart';
import 'package:ecommerceapp/screens/filter/filter_screen.dart';
import 'package:ecommerceapp/tabbar/tabbar_data.dart';
import 'package:ecommerceapp/styles/home_screen_styles.dart';
import 'package:ecommerceapp/widgets/show_all_widget.dart';
import 'package:ecommerceapp/widgets/single_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_nullsafety/carousel_nullsafety.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      bottom: const TabBar(
        labelPadding: EdgeInsets.symmetric(horizontal: 22),
        indicator: BoxDecoration(
          color: Colors.transparent,
        ),
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: AppColors.baseBlackColor,
        labelColor: AppColors.baseDarkPinkColor,
        tabs: [
          Text("All"),
          Text("Clothing"),
          Text("Shoes"),
          Text("Accessories"),
        ],
      ),
      backgroundColor: const Color(0xffE3F6FF),
      elevation: 2.0,
      centerTitle: true,
      title: Column(
        children: const [
          Text(
            "Welcome",
            style: HomeScreenStyles.appBaruppertitlestyle,
          ),
          Text(
            "Shopping",
            style: HomeScreenStyles.appBarbottomtitlestyle,
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_alt),
          onPressed: () {
            PageRouting.goToNextPage(
              context: context,
              navigateTo: const FilterScreen(),
            );
          },
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }

  Widget buildAdvertismentPlace() {
    return Padding(
      padding: const EdgeInsets.all(
        10.0,
      ),
      child: SizedBox(
        height: 170,
        child: Carousel(
          autoplay: true,
          animationCurve: Curves.fastLinearToSlowEaseIn,
          animationDuration: const Duration(milliseconds: 1000),
          showIndicator: false,
          images: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://img.freepik.com/free-psd/sale-banner-template_24972-824.jpg?w=1380&t=st=1677328105~exp=1677328705~hmac=92ebd315506ddf667caa773e3069bef58e4fc3afd715301b696aee17e7c21339",
                  ),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://img.freepik.com/free-psd/fashion-model-banner-template_23-2148858371.jpg?t=st=1677328131~exp=1677328731~hmac=552cb46203cefe222610ec257a87b50482e31367f5f89bffa52f96238573d33d",
                  ),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTrendingProduct({
    required String productImage,
    required String productName,
    required String productModel,
    required double productPrice,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          top: 30,
          left: 30,
          right: 20,
          bottom: 20,
        ),
        height: 65,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Material(
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Image.network(productImage),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   productImage,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: HomeScreenStyles.trendingProductNameStyle,
                  // ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    productName,
                    overflow: TextOverflow.ellipsis,
                    style: HomeScreenStyles.trendingProductProductStyle,
                  ),
                  Text(
                    productModel,
                    overflow: TextOverflow.ellipsis,
                    style: HomeScreenStyles.trendingProductProductStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: MaterialButton(
                color: AppColors.baseLightPinkColor,
                elevation: 0,
                height: 45,
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(0.7),
                ),
                onPressed: () {},
                child: Text(
                  "\$ $productPrice",
                  style: HomeScreenStyles.trendingProductPriceStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: TabBarView(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                buildAdvertismentPlace(),
                const ShowAllWidget(
                  leftText: "New Arrival",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: singleProductData.length,
                    primary: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
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
                const Divider(
                  indent: 16,
                  endIndent: 16,
                ),
                const ShowAllWidget(
                  leftText: "What's trending",
                ),
                buildTrendingProduct(
                  productImage:
                      'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8a51a78390b44ed1ab5aaf8500ebf6b5_9366/Own_the_Run_Running_Tank_Top_Orange_HR9992_01_laydown.jpg',
                  productModel: 'Tank-tops',
                  productName: 'Classics mesh tank top',
                  productPrice: 15,
                  onTap: () {
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: const DetailScreen(
                        data: SingleProductModel(
                          productFourImage:
                              "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8a51a78390b44ed1ab5aaf8500ebf6b5_9366/Own_the_Run_Running_Tank_Top_Orange_HR9992_01_laydown.jpg",
                          productImage:
                              "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8a51a78390b44ed1ab5aaf8500ebf6b5_9366/Own_the_Run_Running_Tank_Top_Orange_HR9992_01_laydown.jpg",
                          productModel: 'Tank-Tops',
                          productName: 'Classics mesh tank top',
                          productOldPrice: 20,
                          productPrice: 15,
                          productSecondImage:
                              "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8a51a78390b44ed1ab5aaf8500ebf6b5_9366/Own_the_Run_Running_Tank_Top_Orange_HR9992_01_laydown.jpg",
                          productThirdImage:
                              "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8a51a78390b44ed1ab5aaf8500ebf6b5_9366/Own_the_Run_Running_Tank_Top_Orange_HR9992_01_laydown.jpg",
                        ),
                      ),
                    );
                  },
                ),
                buildTrendingProduct(
                  productImage:
                      'https://rukminim1.flixcart.com/image/832/832/xif0q/shopsy-backpack/j/s/n/backpack-business-laptop-computer-backpack-bag-backpack-backpack-original-imagh4pqpjwhtgn2.jpeg?q=70',
                  productModel: 'Backpack',
                  productName: 'Classics backpack',
                  productPrice: 15,
                  onTap: () {
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: const DetailScreen(
                        data: SingleProductModel(
                          productFourImage:
                              "https://rukminim1.flixcart.com/image/832/832/xif0q/shopsy-backpack/j/s/n/backpack-business-laptop-computer-backpack-bag-backpack-backpack-original-imagh4pqpjwhtgn2.jpeg?q=70",
                          productImage:
                              "https://rukminim1.flixcart.com/image/832/832/xif0q/shopsy-backpack/j/s/n/backpack-business-laptop-computer-backpack-bag-backpack-backpack-original-imagh4pqpjwhtgn2.jpeg?q=70",
                          productModel: 'Backpack',
                          productName: 'Classics backpack',
                          productOldPrice: 20,
                          productPrice: 15,
                          productSecondImage:
                              "https://rukminim1.flixcart.com/image/832/832/xif0q/shopsy-backpack/j/s/n/backpack-business-laptop-computer-backpack-bag-backpack-backpack-original-imagh4pqpjwhtgn2.jpeg?q=70",
                          productThirdImage:
                              "https://rukminim1.flixcart.com/image/832/832/xif0q/shopsy-backpack/j/s/n/backpack-business-laptop-computer-backpack-bag-backpack-backpack-original-imagh4pqpjwhtgn2.jpeg?q=70",
                        ),
                      ),
                    );
                  },
                ),
                buildTrendingProduct(
                  productImage:
                      'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQsCdqJfeFpXbMrtnCvhnZMWLCjS3yljXZdBoIKRKnwWCU_2iP7CKL3b4NpCD2hjR9b3Iu8xUVjgpMU7ihC21bzG5L8HLgrIe0gW1Ue1s6eoBIqB9QYff4xvQ&usqp=CAE',
                  productModel: 'T-shirt',
                  productName: 'Trendy',
                  productPrice: 15,
                  onTap: () {
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: const DetailScreen(
                        data: SingleProductModel(
                          productFourImage:
                              "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQsCdqJfeFpXbMrtnCvhnZMWLCjS3yljXZdBoIKRKnwWCU_2iP7CKL3b4NpCD2hjR9b3Iu8xUVjgpMU7ihC21bzG5L8HLgrIe0gW1Ue1s6eoBIqB9QYff4xvQ&usqp=CAE",
                          productImage:
                              "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQsCdqJfeFpXbMrtnCvhnZMWLCjS3yljXZdBoIKRKnwWCU_2iP7CKL3b4NpCD2hjR9b3Iu8xUVjgpMU7ihC21bzG5L8HLgrIe0gW1Ue1s6eoBIqB9QYff4xvQ&usqp=CAE",
                          productModel: 'T-shirt',
                          productName: 'Trendy',
                          productOldPrice: 20,
                          productPrice: 15,
                          productSecondImage:
                              "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQsCdqJfeFpXbMrtnCvhnZMWLCjS3yljXZdBoIKRKnwWCU_2iP7CKL3b4NpCD2hjR9b3Iu8xUVjgpMU7ihC21bzG5L8HLgrIe0gW1Ue1s6eoBIqB9QYff4xvQ&usqp=CAE",
                          productThirdImage:
                              "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQsCdqJfeFpXbMrtnCvhnZMWLCjS3yljXZdBoIKRKnwWCU_2iP7CKL3b4NpCD2hjR9b3Iu8xUVjgpMU7ihC21bzG5L8HLgrIe0gW1Ue1s6eoBIqB9QYff4xvQ&usqp=CAE",
                        ),
                      ),
                    );
                  },
                ),
                const ShowAllWidget(
                  leftText: "History",
                ),
                SizedBox(
                  height: 200,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    primary: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1,
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
                    itemCount: singleProductData.length,
                  ),
                )
              ],
            ),
            Tabbar(
              productData: clothesData,
            ),
            Tabbar(
              productData: shoesData,
            ),
            Tabbar(
              productData: accessoriesData,
            ),
          ],
        ),
      ),
    );
  }
}
