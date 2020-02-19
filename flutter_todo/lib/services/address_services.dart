import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter_todo/models/address_model.dart';

Future<String> _loadAAddressAsset() async {
  return await rootBundle.loadString('assets/address.json');
}

Future loadAddress() async {
  String jsonString = await _loadAAddressAsset();
  final jsonResponse = json.decode(jsonString);
  Address address = new Address.fromJson(jsonResponse);
  print('Address Street: ' + address.streets[1].toString() + ' adress_services 14');
}