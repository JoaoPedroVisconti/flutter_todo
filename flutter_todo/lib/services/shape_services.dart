import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter_todo/models/shape_model.dart';


Future<String> _loadAShapeAsset() async {
  return await rootBundle.loadString('assets/shape.json');
}

Future loadShape() async {
  String jsonString = await _loadAShapeAsset();
  final jsonResponse = json.decode(jsonString);
  Shape shape = new Shape.fromJson(jsonResponse);
  print('Shape property - breadth: ' + shape.property.breadth.toString() + " shape_services - 16");
}
