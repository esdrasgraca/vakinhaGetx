
import 'dart:convert';

import 'package:vakinha_burger_mobile/app/models/product_model.dart';

class ShoppingCardModel {
  int quantity;
  ProductModel product;
  ShoppingCardModel({
    required this.quantity,
    required this.product,
  });

  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'product': product.toMap(),
    };
  }

  factory ShoppingCardModel.fromMap(Map<String, dynamic> map) {
    return ShoppingCardModel(
      quantity: map['quantity']?.toInt() ?? 0,
      product: ProductModel.fromMap(map['product']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShoppingCardModel.fromJson(String source) => ShoppingCardModel.fromMap(json.decode(source));
}
