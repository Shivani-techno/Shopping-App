class SingleProductModel {
  final String productName;
  final String productImage;
  final String productModel;
  final double productPrice;
  final double productOldPrice;
  final String productSecondImage;
  final String productThirdImage;
  final String productFourImage;

  const SingleProductModel({
    required this.productFourImage,
    required this.productImage,
    required this.productModel,
    required this.productName,
    required this.productOldPrice,
    required this.productPrice,
    required this.productSecondImage,
    required this.productThirdImage,
  });
}
