import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/app/core/bindings/application_bindings.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger_mobile/app/routes/auth_routers.dart';
import 'package:vakinha_burger_mobile/app/routes/home_routers.dart';
import 'package:vakinha_burger_mobile/app/routes/product_routers.dart';
import 'package:vakinha_burger_mobile/app/routes/splash_routers.dart';

void main() async {
  await GetStorage.init();
  runApp(const VakinhaBurgerApp());
}

class VakinhaBurgerApp extends StatelessWidget {
  const VakinhaBurgerApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      initialBinding: ApplicationBindings(),
      title: 'Vakinha Burger',
      theme: VakinhaUI.theme,
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
        ...ProductRouters.routers,
      ],
    );
  }
}