import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:promarket/config/colors.dart';
import 'package:promarket/src/components/banners.dart';
import 'package:promarket/src/components/home_brands.dart';
import 'package:promarket/src/components/home_category.dart';
import 'package:promarket/src/components/home_tabs.dart';
import 'package:promarket/src/controllers/auth_controller.dart';
import 'package:promarket/src/controllers/notification_controller.dart';
import 'package:promarket/src/pages/category_products.dart';

import '../../config/global_config.dart';
import '../components/default_adress.dart';
import '../controllers/shop_controller.dart';
import '../models/address.dart';
import '../models/shop.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  final AuthController authController = Get.put(AuthController());
  final ShopController shopController = Get.put(ShopController());

  final NotificationController notificationController =
      Get.put(NotificationController());
  int tabIndex = 2;

  @override
  void initState() {
    super.initState();
    notificationController.getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    Shop? shop = shopController.defaultShop.value;
    return Scaffold(
        backgroundColor: Get.isDarkMode
            ? Color.fromRGBO(19, 20, 21, 1)
            : Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppConstants.backgroundWhite,
          iconTheme: IconThemeData(color: Colors.black),
          title: Row(
            children: [
              ClipRRect(

                child: Container(
                  height: 40,
                  width: 40,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: "$GLOBAL_IMAGE_URL"+"${shop?.logoUrl}",
                    placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      child: Icon(
                        const IconData(0xee4b, fontFamily: 'MIcon'),
                        color: Color.fromRGBO(233, 233, 230, 1),
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('We will deliver today'.tr, style: TextStyle(color: Colors.black, fontSize: 15),),
                Row(
                  children: [
                    Text('${shop?.openHours}-${shop?.closeHours}', style: TextStyle(color: Colors.black),),
                    SizedBox(width: 5,),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(

                        const IconData(0xee58, fontFamily: 'MIcon'),
                        size: 18.sp,
                        color: Get.isDarkMode
                                ? Color.fromRGBO(255, 255, 255, 1)
                                : Color.fromRGBO(180, 181, 182, 1.0),
                      ),
                    )
                  ],
                )
              ],)
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 100),
          child: Column(
            children: <Widget>[
              DefaultAdress(shopController: shopController),

              Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: AppConstants.backgroundGrey,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: TextField(

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: AppConstants.backgroundWhite,
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Find products from'.tr + ' ${shop?.name}',
                      hintText: 'Please type product\'s name',

                  ),
                ),
              ),

              // CategoryProducts(),
              Banners(),
              // HomeTabs(),
              HomeCategory(),
              // HomeBrands()
            ],
          )),
    );
        // NestedScrollView(
        //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        //     return <Widget>[];
        //   },
        //   body: SingleChildScrollView(
        //       padding: EdgeInsets.only(bottom: 100),
        //       child: Column(
        //         children: <Widget>[
        //           Banners(),
        //           HomeTabs(),
        //           HomeCategory(),
        //           HomeBrands()
        //         ],
        //       )),
        // ),

  }
}
