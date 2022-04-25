import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promarket/src/components/home_category_products.dart';
import 'package:promarket/src/controllers/category_controller.dart';

class HomeCategory extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: controller.categoryList.map((item) {
            return HomeCategoryProducts(
              name: item.name,
              id: item.id,
              imageUrl: item.imageUrl,
            );
          }).toList(),
        ));
  }
}
