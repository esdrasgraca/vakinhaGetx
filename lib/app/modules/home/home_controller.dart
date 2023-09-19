
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/services/auth_service.dart';
import 'package:vakinha_burger_mobile/app/modules/menu/menu_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/menu/menu_page.dart';

class HomeController extends GetxController {  
  
  static const NAVIGATOR_KEY = 1;

  final _tabidex = 0.obs;
  final _tabs = ['/menu', '/order/shopping_card','/exit'];

  int get tabidex => _tabidex.value;

  set tabIndex(int index) {
    _tabidex(index);
    if(_tabs[index] == '/exit') {
      Get.find<AuthService>().logout();
    }else {
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  Route? onGeneratedRouter(RouteSettings settings) {
    if(settings.name == '/menu') {
      return GetPageRoute(
        settings: settings,
        page: () => MenuPage(),
        binding: MenuBindings(),
        transition: Transition.fadeIn,
      );
    }

    if(settings.name == '/order/shopping_card') {
      
    }
  }
}