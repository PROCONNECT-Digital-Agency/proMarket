import 'package:get/get.dart';
import 'package:promarket/src/pages/about.dart';
import 'package:promarket/src/pages/banner_details.dart';
import 'package:promarket/src/pages/brands.dart';
import 'package:promarket/src/pages/brands_products.dart';
import 'package:promarket/src/pages/cart.dart';
import 'package:promarket/src/pages/category_products.dart';
import 'package:promarket/src/pages/chat.dart';
import 'package:promarket/src/pages/checkout.dart';
import 'package:promarket/src/pages/currency.dart';
import 'package:promarket/src/pages/forgot_password.dart';
import 'package:promarket/src/pages/language_init.dart';
import 'package:promarket/src/pages/languages.dart';
import 'package:promarket/src/pages/liked.dart';
import 'package:promarket/src/pages/loading.dart';
import 'package:promarket/src/pages/location.dart';
import 'package:promarket/src/pages/location_list.dart';
import 'package:promarket/src/pages/lost_connection.dart';
import 'package:promarket/src/pages/main.dart';
import 'package:promarket/src/pages/navigation.dart';
import 'package:promarket/src/pages/notifications.dart';
import 'package:promarket/src/pages/order_history.dart';
import 'package:promarket/src/pages/order_success.dart';
import 'package:promarket/src/pages/privacy.dart';
import 'package:promarket/src/pages/product_detail.dart';
import 'package:promarket/src/pages/profile.dart';
import 'package:promarket/src/pages/profile_settings.dart';
import 'package:promarket/src/pages/qa.dart';
import 'package:promarket/src/pages/reset_password.dart';
import 'package:promarket/src/pages/settings.dart';
import 'package:promarket/src/pages/social_media.dart';
import 'package:promarket/src/pages/splash.dart';
import 'package:promarket/src/pages/store_info.dart';
import 'package:promarket/src/pages/store_location.dart';
import 'package:promarket/src/pages/sign_in.dart';
import 'package:promarket/src/pages/sign_up.dart';
import 'package:promarket/src/pages/store.dart';
import 'package:promarket/src/pages/sub_category_products.dart';
import 'package:promarket/src/pages/terms.dart';
import 'package:promarket/src/pages/verify_phone.dart';

class AppRoutes {
  AppRoutes._();
  static final routes = [
    GetPage(name: '/', page: () => Loading()),
    GetPage(name: '/home', page: () => MainPage()),
    GetPage(
        name: '/signin',
        page: () => SignInPage(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/signup',
        page: () => SignUpPage(),
        transition: Transition.fade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
      name: '/store',
      page: () => StorePage(),
    ),
    GetPage(
        name: '/location',
        page: () => LocationPage(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/shopsLocation',
        page: () => StoreLocation(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/shopInfo',
        page: () => StoreInfo(),
        transition: Transition.downToUp,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/locationList',
        page: () => LocationList(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/profile',
        page: () => ProfilePage(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/about',
        page: () => About(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/privacy',
        page: () => Privacy(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/terms',
        page: () => Terms(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/qa',
        page: () => Qa(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/forgotPassword',
        page: () => ForgotPasswordPage(),
        transition: Transition.downToUp,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/verifyPhone',
        page: () => VerifyPhonePage(),
        transition: Transition.downToUp,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/brands',
        page: () => Brands(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/categoryProducts',
        page: () => CategoryProducts(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/subCategoryProducts',
        page: () => SubCategoryProducts(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/cart',
        page: () => Cart(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/settings',
        page: () => Settings(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/socialMedia',
        page: () => SocialMedia(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/profileSettings',
        page: () => ProfileSettings(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/liked',
        page: () => Liked(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/currency',
        page: () => Currency(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/language',
        page: () => Languages(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/orderHistory',
        page: () => OrderHistory(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/notifications',
        page: () => Notifications(),
        transition: Transition.upToDown,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/productDetail',
        page: () => ProductDetail(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/chat',
        page: () => Chat(),
        transition: Transition.downToUp,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/orderHistory',
        page: () => OrderHistory(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/checkout',
        page: () => Checkout(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/orderSuccess',
        page: () => OrderSuccess(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/profileSettings',
        page: () => ProfileSettings(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/navigation',
        page: () => Navigation(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/brandProducts',
        page: () => BrandsProducts(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/bannerDetails',
        page: () => BannerDetails(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/resetPassword',
        page: () => ResetPassword(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(name: '/languageInit', page: () => LanguageInit()),
    GetPage(name: '/noConnection', page: () => LostConnection()),
    GetPage(name: '/splash', page: () => SplashPage()),
  ];
}
