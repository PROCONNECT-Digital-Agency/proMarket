import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:promarket/src/components/appbar.dart';
import 'package:promarket/src/components/brand_categories.dart';
import 'package:promarket/src/components/search_input.dart';
import 'package:promarket/src/controllers/brands_controller.dart';

class Brands extends GetView<BrandsController> {
  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      backgroundColor: Get.isDarkMode
          ? Color.fromRGBO(19, 20, 21, 1)
          : Color.fromRGBO(243, 243, 240, 1),
      appBar: PreferredSize(
          preferredSize: Size(1.sw, statusBarHeight + appBarHeight),
          child: AppBarCustom(
            title: "Brands".tr,
            hasBack: true,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SearchInput(
              title: "Search brands".tr,
              hasSuffix: false,
            ),
            Obx(() {
              return Column(
                children: controller.brandCategoriesList.map((item) {
                  return BrandCategories(
                    name: item.name,
                    id: item.id,
                  );
                }).toList(),
              );
            })
          ],
        ),
      ),
    );
  }
}
