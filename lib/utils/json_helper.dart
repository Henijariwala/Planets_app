import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:galaxy_planets/screen/home/model/home_model.dart';

class JsonHelper {

  Future<List<Planet>> planetJson() async {
    var jsonString = await rootBundle.loadString('assets/json/planets.json');
    List json = jsonDecode(jsonString);
    List<Planet> list  = json.map((e) => Planet.mapToModel(e)).toList();
    return list;
  }

}