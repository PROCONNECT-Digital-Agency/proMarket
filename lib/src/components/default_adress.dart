
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../config/colors.dart';
import '../controllers/shop_controller.dart';
import '../models/address.dart';

class DefaultAdress extends StatelessWidget {
  const DefaultAdress({
    Key? key,
    required this.shopController,
  }) : super(key: key);

  final ShopController shopController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,


      decoration: BoxDecoration(
          color: Get.isDarkMode
              ? Color.fromRGBO(37, 48, 63, 1)
              : Color.fromRGBO(255, 255, 255, 1)),
      padding:
      EdgeInsets.only(left: 15, right: 20, ),
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
            shopController.addressController.getDefaultAddress();

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
    );
  }
}
