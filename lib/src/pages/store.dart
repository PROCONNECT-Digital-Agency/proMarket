import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:promarket/config/colors.dart';
import 'package:promarket/config/global_config.dart';
import 'package:promarket/src/components/custom_btn.dart';
import 'package:promarket/src/components/shop_list_vertical.dart';
import 'package:promarket/src/components/tab_button.dart';
import 'package:promarket/src/controllers/shop_controller.dart';
import 'package:promarket/src/models/address.dart';
import 'package:promarket/src/models/user.dart';

class StorePage extends GetView<ShopController> {
  @override
  Widget build(BuildContext context) {
    User? user = controller.authController.user.value;
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var appBarHeight = AppBar().preferredSize.height;

    return WillPopScope(
        child: Scaffold(
          backgroundColor: Get.isDarkMode
              ? Color.fromRGBO(19, 20, 21, 1)
              : Color.fromRGBO(243, 243, 240, 1),
          appBar: PreferredSize(
            preferredSize: Size(1.sw, statusBarHeight + appBarHeight),
            child: Container(
              width: 1.sw,
              height: statusBarHeight + appBarHeight,
              decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? Color.fromRGBO(37, 48, 63, 1)
                      : Color.fromRGBO(255, 255, 255, 1)),
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: statusBarHeight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Container(
                  //   width: 34,
                  //   height: 34,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(17),
                  //       color: Color.fromRGBO(69, 165, 36, 1)),
                  //   child: Icon(
                  //     const IconData(0xef09, fontFamily: 'MIcon'),
                  //     size: 20.sp,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  Obx(() {
                    Address address =
                        controller.addressController.getDefaultAddress();

                    return Container(
                      height: 35,
                      width: 1.sw - 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Delivery address".tr,
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w300,
                                fontSize: 12.sp,
                                letterSpacing: -0.5,
                                color: Get.isDarkMode
                                    ? Color.fromRGBO(130, 139, 150, 1)
                                    : Color.fromRGBO(136, 136, 126, 1)),
                          ),
                          Container(
                            width: 1.sw - 160,
                            child: Text(
                              "${address.address}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                                letterSpacing: -0.5,
                                color: Get.isDarkMode
                                    ? Color.fromRGBO(255, 255, 255, 1)
                                    : Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppConstants.buttonBColor),
                    child: Center(
                      child: IconButton(
                        onPressed: () => Get.toNamed("/locationList"),
                        icon: Icon(Icons.edit),
                        iconSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: ShopListVertical(),
          extendBody: true,
          bottomNavigationBar: Container(
              height: 60,
              width: 1.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Get.isDarkMode
                    ? Color.fromRGBO(37, 48, 63, 1)
                    : Color.fromRGBO(255, 255, 255, 1),
                boxShadow: [
                  // BoxShadow(
                  //   color: Colors.grey.withOpacity(0.5),
                  //   spreadRadius: 2,
                  //   blurRadius: 5,
                  //   offset: Offset(0, 3), // changes position of shadow
                  // ),
                ],
              ),
              alignment: Alignment.topCenter,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    height: 60,
                    width: 1.sw,
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 28, right: 43),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Obx(() => Container(
                              width: 0.66.sw,
                              height: 40,
                              child: TabBar(
                                  indicatorColor: Colors.transparent,
                                  controller: controller.tabController,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  labelPadding: EdgeInsets.all(0),
                                  onTap: (index) {
                                    controller.onChangeDeliveryType(index + 1);
                                  },
                                  tabs: [
                                    Tab(
                                      child: TabButton(
                                        isActive:
                                            controller.deliveryType.value == 1,
                                        title: "Delivery".tr,
                                        icon: controller.deliveryType.value == 1
                                            ? const IconData(0xf1e1,
                                                fontFamily: 'MIcon')
                                            : const IconData(0xf1e2,
                                                fontFamily: 'MIcon'),
                                      ),
                                    ),
                                    Tab(
                                      child: TabButton(
                                        isActive:
                                            controller.deliveryType.value == 2,
                                        title: "Pickup".tr,
                                        icon: controller.deliveryType.value == 2
                                            ? const IconData(0xf115,
                                                fontFamily: 'MIcon')
                                            : const IconData(0xf116,
                                                fontFamily: 'MIcon'),
                                        isSecond: true,
                                      ),
                                    )
                                  ]),
                            )),
                        if (user!.id != null && user.id! > 0)
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 3,
                                    color: Get.isDarkMode
                                        ? Color.fromRGBO(130, 139, 150, 0.1)
                                        : Color.fromRGBO(136, 136, 126, 0.1)),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                                onTap: () {
                                  Get.toNamed("/profile");
                                },
                                child: user.imageUrl!.length > 4
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedNetworkImage(
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.fill,
                                          imageUrl:
                                              "$GLOBAL_IMAGE_URL${user.imageUrl}",
                                          placeholder: (context, url) =>
                                              Container(
                                            width: 40,
                                            height: 40,
                                            alignment: Alignment.center,
                                            child: Icon(
                                              const IconData(0xee4b,
                                                  fontFamily: 'MIcon'),
                                              color: Color.fromRGBO(
                                                  233, 233, 230, 1),
                                              size: 20.sp,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ))
                                    : Icon(
                                        const IconData(0xf25c,
                                            fontFamily: 'MIcon'),
                                        color: Get.isDarkMode
                                            ? Color.fromRGBO(255, 255, 255, 1)
                                            : Color.fromRGBO(0, 0, 0, 1),
                                        size: 20,
                                      )),
                          )
                        else
                          SizedBox(
                              height: 60,
                              width: 40,
                              child: IconButton(
                                  onPressed: () {
                                    controller.authController.logout();
                                  },
                                  icon: Icon(
                                    const IconData(0xeed4, fontFamily: 'MIcon'),
                                    color: Get.isDarkMode
                                        ? Color.fromRGBO(255, 255, 255, 1)
                                        : Color.fromRGBO(0, 0, 0, 1),
                                    size: 20,
                                  )))
                      ],
                    ),
                  ),
                ),
              )),
        ),
        onWillPop: () async {
          final value = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('Are you sure you want to exit?'),
                  actions: <Widget>[
                    CustomButton(
                      width: 0.3.sw,
                      height: 60,
                      backColor: Color.fromRGBO(221, 35, 57, 1),
                      title: "Yes, Exit",
                      onPress: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                    CustomButton(
                      width: 0.3.sw,
                      height: 60,
                      backColor: Color.fromRGBO(69, 165, 36, 1),
                      title: "No",
                      onPress: () {
                        Navigator.of(context).pop(false);
                      },
                    )
                  ],
                );
              });

          return value == true;
        });
  }
}
