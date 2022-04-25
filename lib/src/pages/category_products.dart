import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:promarket/src/components/appbar.dart';
import 'package:promarket/src/components/category_item.dart';
import 'package:promarket/src/components/category_products_item.dart';
import 'package:promarket/src/components/empty.dart';
import 'package:promarket/src/components/filter.dart';
import 'package:promarket/src/components/search_input.dart';
import 'package:promarket/src/components/shadows/category_item_shadow.dart';
import 'package:promarket/src/components/shadows/category_product_item_shadow.dart';
import 'package:promarket/src/controllers/category_controller.dart';
import 'package:promarket/src/models/category.dart';
import 'package:promarket/src/models/product.dart';

class CategoryProducts extends GetView<CategoryController> {
  Widget loading() {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CategoryProductItemShadow(),
            CategoryProductItemShadow()
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CategoryProductItemShadow(),
            CategoryProductItemShadow()
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      String name = controller.activeCategory.value.name!;
      int id = controller.activeCategory.value.id!;
      var statusBarHeight = MediaQuery.of(context).padding.top;
      var appBarHeight = AppBar().preferredSize.height;

      return Scaffold(
        backgroundColor: Get.isDarkMode
            ? Color.fromRGBO(19, 20, 21, 1)
            : Color.fromRGBO(243, 243, 240, 1),
        appBar: PreferredSize(
            preferredSize: Size(1.sw, statusBarHeight + appBarHeight),
            child: AppBarCustom(
              title: "$name",
              hasBack: true,
              onBack: () {
                controller.productController.clearFilter();
                controller.load.value = true;
                controller.categoryProductList[id] = [];
              },
            )),
        body: Scrollbar(
            child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 20),
          controller: controller.scrollController,
          child: Column(
            children: <Widget>[
              SearchInput(
                title: "Search products".tr,
                onChange: (text) {
                  controller.load.value = true;
                  controller.categoryProductList[id] = [];
                  controller.categoryProductList.refresh();
                  controller.productController.searchText.value = text;
                },
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) {
                        return Filter(
                          onPress: () {
                            controller.load.value = true;
                            controller.categoryProductList[id] = [];
                            controller.categoryProductList.refresh();
                            Get.back();
                          },
                        );
                      });
                },
              ),
              Container(
                  width: 1.sw,
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 1.sw,
                          height: 150,
                          margin: EdgeInsets.only(top: 20),
                          child: FutureBuilder<List<Category>>(
                            future: controller.getCategories(id, -1, 0),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<Category> categories = snapshot.data!;

                                return ListView.builder(
                                    itemCount: categories.length,
                                    scrollDirection: Axis.horizontal,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    itemBuilder: (context, index) {
                                      return CategoryItem(
                                        imageUrl: categories[index].imageUrl,
                                        name: categories[index].name,
                                        id: categories[index].id,
                                      );
                                    });
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }

                              return ListView.builder(
                                  itemCount: 5,
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  itemBuilder: (context, index) {
                                    return CategoryItemShadow();
                                  });
                            },
                          )),
                      FutureBuilder<List<Product>>(
                        future: controller.getCategoryProducts(id, false),
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              (!controller.load.value ||
                                  controller.categoryProductList[id]!.length >
                                      0)) {
                            List<Product> products =
                                controller.categoryProductList[id]!;

                            List<Widget> row = [];
                            List<Widget> subRow = [];

                            for (int i = 0; i < products.length; i++) {
                              subRow.add(CategoryProductItem(
                                product: products[i],
                              ));

                              if ((i + 1) % 2 == 0 ||
                                  (i + 1) == products.length) {
                                row.add(Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: subRow.toList(),
                                ));

                                subRow = [];
                              }
                            }

                            return row.length == 0
                                ? Empty(message: "No products".tr)
                                : Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Column(
                                      children: row.toList(),
                                    ),
                                  );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }

                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: loading(),
                          );
                        },
                      ),
                      if (controller.load.value)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: loading(),
                        )
                    ],
                  ))
            ],
          ),
        )),
      );
    });
  }
}
