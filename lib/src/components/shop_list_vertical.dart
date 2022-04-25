import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:promarket/config/colors.dart';
import 'package:promarket/config/global_config.dart';
import 'package:promarket/src/components/empty.dart';

import 'package:promarket/src/components/shop_categories_list_widget.dart';

import 'package:promarket/src/controllers/shop_controller.dart';

class ShopListVertical extends GetView<ShopController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final List myProducts = controller.shopList;
      return Container(
          color: Get.isDarkMode
              ? Color.fromRGBO(37, 48, 63, 0.7)
              : Color.fromRGBO(235, 236, 238, 1),

          child: Column(children: <Widget>[

            ShopCategoriesLisWidget(),
            Expanded(
              child: Container(
                color: AppConstants.backgroundGrey,
                  width: 1.sw,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

                  child: !controller.loading.value
                      ? controller.shopList.length > 0 ?
                  GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(

                          maxCrossAxisExtent: 200,
                          childAspectRatio: 3 / 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemCount: myProducts.length,
                      itemBuilder: (BuildContext ctx, index) {
                        String openShop = myProducts[index]['open_hour'];
                        String closeShop = myProducts[index]['close_hour'];
                        if (openShop != null && openShop.length >= 3) {
                          openShop = openShop.substring(0, openShop.length - 3);
                        }
                        if (closeShop != null && closeShop.length >= 3) {
                          closeShop = closeShop.substring(0, closeShop.length - 3);
                        }
                        return InkWell(
                          onTap: ()=> controller.addToSavedShop(myProducts[index]),
                          child: Container(

                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 40, left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Expanded(child: SizedBox(),),
                                  Text('today'.tr, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18), ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Text(openShop, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),),
                                      Text(' - ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),),
                                      Text(closeShop, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(15),
                                color: Color.fromRGBO(24, 49, 100, 1)
                                // image: DecorationImage(
                                //   fit: BoxFit.fill,
                                //   image: NetworkImage('$GLOBAL_IMAGE_URL'+myProducts[index]['logo_url'], )
                                // ),
                            ),
                          ),
                        );
                      })
                          // ? Column(
                          //     children: controller.shopList.map((shop) {
                          //     int index = controller.shopList
                          //         .indexWhere((element) => element == shop);
                          //
                          //     return InkWell(
                          //       child: ShopListVerticalItem(
                          //         name: shop['language']['name'],
                          //         description: shop['language']['description'],
                          //         rating: shop['rating'].toString(),
                          //         openHour: shop['open_hour'].substring(0, 5),
                          //         closeHour: shop['close_hour'].substring(0, 5),
                          //         logo: shop['logo_url'],
                          //         isLast:
                          //             index == (controller.shopList.length - 1),
                          //       ),
                          //       onTap: () => controller.addToSavedShop(shop),
                          //     );
                          //   }).toList())
                          : Empty(message: "No shops".tr)
                      : Center(child: CircularProgressIndicator(color: Colors.green,),)),
            )
          ]));
    });
  }
}
