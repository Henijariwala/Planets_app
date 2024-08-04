import 'package:flutter/material.dart';
import 'package:galaxy_planets/screen/home/model/home_model.dart';

import '../../../utils/json_helper.dart';
import '../../../utils/share_helper.dart';

class HomeProvider with ChangeNotifier {
  List<Planet> planetList = [];
  List<String> bookMarkPlanet = [];
  List<String>nameList = [];
  List<String>imageList = [];
  bool isTheme = false;
  ThemeMode mode = ThemeMode.dark;
  IconData themeMode = Icons.dark_mode;
  bool isOn = true;
  ShareHelper shareHelper = ShareHelper();

  Future<void> setBookMark(String name1, String pImg) async {
    List<String>? name = await shareHelper.getNameList();
    List<String>? img = await shareHelper.getImageList();
    if (name != null && img != null) {
      name.add(name1);
      img.add(pImg);
      shareHelper.setNameList(name);
      shareHelper.setImageList(img);
    } else {
      shareHelper.setNameList([name1]);
      shareHelper.setImageList([pImg]);
    }
    shareHelper.getNameList();
    shareHelper.getImageList();

    notifyListeners();
  }

  Future<void> getBookMark() async {
    var list = await shareHelper.getNameList();
    var list2 = await shareHelper.getImageList();
    if (list2 != null && list != null) {
      nameList = list2;
      imageList = list;
      notifyListeners();
    }
    }

  void setThemeData() async {
    isTheme = !isTheme;
    setThemeName(isTheme: isTheme);
    isTheme = (await getThemeName())!;
    if (isTheme == true) {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    } else if (isTheme == false) {
      mode = ThemeMode.light;
      themeMode = Icons.dark_mode;
    }
    notifyListeners();
  }

  void getThemeData() async {
    if (await getThemeName() == null) {
      isTheme = false;
    } else {
      isTheme = (await getThemeName())!;
    }
    if (isTheme == true) {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    } else if (isTheme == false) {
      mode = ThemeMode.light;
      themeMode = Icons.dark_mode;
    } else {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    }
    notifyListeners();
  }

  void changeTheme() {
    isOn = !isOn;
    notifyListeners();
  }

  void getData() async {
    JsonHelper helper = JsonHelper();

    List<Planet> l1 = await helper.planetJson();
    if (l1 != null) {
      planetList = l1;
      notifyListeners();
    }
  }
}