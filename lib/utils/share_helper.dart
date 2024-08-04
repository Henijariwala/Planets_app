import 'package:shared_preferences/shared_preferences.dart';

void setThemeName({required bool isTheme}) async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  shr.setBool("theme", isTheme);
}

Future<bool?> getThemeName() async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  return shr.getBool("theme");
}

class ShareHelper {
  Future<void> setImageList(List<String> l1) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setStringList('planet', l1);
  }
  Future<void> setNameList(List<String> l1) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setStringList('planet', l1);
  }

  Future<List<String>?> getNameList() async {
    SharedPreferences shr= await SharedPreferences.getInstance();
    return shr.getStringList("name");
  }
  Future<List<String>?> getImageList() async {
    SharedPreferences shr= await SharedPreferences.getInstance();
    return shr.getStringList("image");
  }
}