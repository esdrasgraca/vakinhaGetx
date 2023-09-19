import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/ui/formartter_helper.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger_mobile/app/models/product_model.dart';

class ProductTile extends StatelessWidget {

  final ProductModel product;

  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 80,
        child: Row(
          children: [
            Container(
              width: 80,
              decoration: const BoxDecoration(
                  borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://conteudo.imguol.com.br/c/entretenimento/ee/2022/04/28/hamburguer-sanduiche-lanche-1651166602338_v2_1x1.jpg'))),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    product.name,
                    style: VakinhaUI.textBold,
                  ),
                  Text(
                    FormartterHelper.formatCurrencyDouble(product.price),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
