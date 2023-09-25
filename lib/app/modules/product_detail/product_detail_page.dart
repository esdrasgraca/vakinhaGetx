import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/ui/formartter_helper.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/plus_minus_box.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_button.dart';
import './product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(),
      body: LayoutBuilder(
        builder: (_, constrains) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constrains.maxHeight,
                  minWidth: constrains.minWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: context.width,
                    height: context.heightTransformer(reducedBy: 60),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://www.estadao.com.br/resizer/YIBfPUoXUOKRYG7IVo-jptwsSFY=/720x503/filters:format(jpg):quality(80):focal(3070x2285:3080x2295)/cloudfront-us-east-1.images.arcpublishing.com/estadao/L3LYN5Y4MRG6BB47MNHEEXDRGA.jpeg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      controller.product.name,
                      style: context.textTheme.headline4!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      controller.product.description,
                      style: context.textTheme.bodyText2!.copyWith(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    return PlusMinusBox(
                      minusCallback: controller.removeProduct,
                      plusCallback: controller.addProduct,
                      price: controller.product.price,
                      quantity: controller.quantity,
                    );
                  }),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      'Total',
                      style: VakinhaUI.textBold,
                    ),
                    trailing: Obx(() {
                      return Text(
                        FormartterHelper.formatCurrencyDouble(
                            controller.totalPrice),
                        style: VakinhaUI.textBold,
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: SizedBox(
                          width: context.widthTransformer(reducedBy: 10),
                          child: VakinhaButton(
                            label: controller.alreadyAdded ? 'ATUALIZAR' : 'ADICIONAR',
                            onPressed: controller.addProductInShoppingCard,
                          )))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
