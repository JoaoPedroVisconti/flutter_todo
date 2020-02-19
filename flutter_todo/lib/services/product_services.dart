import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter_todo/models/product_model.dart';

Future<String> _loadProductAsset() async {
  return await rootBundle.loadString('assets/product.json');
}

Future loadProduct() async {
  String jsonString = await _loadProductAsset();
  final jsonResponse = json.decode(jsonString);
  Product product = new Product.fromJson(jsonResponse);
  print('Product - image - name: ' + product.images[1].imageName + ' image_services 14');
}