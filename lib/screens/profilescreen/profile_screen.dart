import 'package:ecommerceapp/appColors/app_colors.dart';
import 'package:ecommerceapp/svgimages/svg_images.dart';
import 'package:ecommerceapp/widgets/my_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  AppBar buildAppBar() {
    return AppBar(
      elevation: 1,
      centerTitle: true,
      backgroundColor: const Color(0xffE3F6FF),
      title: const Text(
        "Account",
        style: TextStyle(
          color: AppColors.baseBlackColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            SvgImages.edit,
            color: AppColors.baseBlackColor,
            width: 25,
          ),
        ),
      ],
      shadowColor: AppColors.baseGrey10Color,
    );
  }

  Widget buildListTileWidget({
    required String leading,
    required String trailing,
  }) {
    return ListTile(
      tileColor: AppColors.baseWhiteColor,
      leading: Text(
        leading,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        trailing,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget buildBottomListTile({
    required String leading,
    required String trailing,
  }) {
    return ListTile(
      onTap: () {},
      tileColor: AppColors.baseWhiteColor,
      leading: Text(
        leading,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Wrap(
        spacing: 5,
        children: [
          Text(
            trailing,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseGrey10Color,
      appBar: buildAppBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            height: 200,
            margin: const EdgeInsets.only(bottom: 10),
            color: AppColors.basewhite60Color,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Center(
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                          "https://i.pinimg.com/originals/7b/48/65/7b48654b92587f3df86c21d7071bad42.jpg"),
                    ),
                  ),
                  Text(
                    "Shivani",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Mnit Jaipur",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            color: AppColors.baseWhiteColor,
            child: Column(
              children: [
                buildListTileWidget(
                  leading: "Full Name",
                  trailing: "Shivani",
                ),
                const Divider(),
                buildListTileWidget(
                  leading: "Email",
                  trailing: "shivanichoudhary@gmail.com",
                ),
                buildListTileWidget(
                  leading: "Address",
                  trailing: "MNIT Jaipur",
                ),
                buildListTileWidget(
                  leading: "Payment",
                  trailing: "6011********476",
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 10,
            ),
            color: AppColors.baseWhiteColor,
            child: Column(
              children: [
                buildBottomListTile(
                  leading: "WishList",
                  trailing: "5",
                ),
                const Divider(),
                buildBottomListTile(
                  leading: "My Bag",
                  trailing: "3",
                ),
                const Divider(),
                buildBottomListTile(
                  leading: "My Orders",
                  trailing: "1 in transit",
                ),
                const Divider(),
                buildBottomListTile(
                  leading: "My Orders",
                  trailing: "1 in transit",
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: MyButtonWidget(
              onPress: () {},
              color: AppColors.baseDarkPinkColor,
              text: "Log Out",
            ),
          ),
        ],
      ),
    );
  }
}
