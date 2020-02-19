import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter_todo/models/photo_model.dart';

Future<String> _loadPhotoAsset() async {
  return await rootBundle.loadString('assets/photo.json');
}

Future loadPhoto() async {
  String jsonPhotos = await _loadPhotoAsset();
  final jsonResponse = json.decode(jsonPhotos);
  PhotosList photosList = new PhotosList.fromJson(jsonResponse);
  print('Photo Title: ' + photosList.photos[1].title.toString() + ' photo_services 15');
}