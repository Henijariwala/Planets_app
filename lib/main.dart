import 'package:flutter/material.dart';
import 'package:galaxy_planets/utils/app_routes.dart';
import 'package:galaxy_planets/screen/home/provider/homeProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider.value(value: HomeProvider())],
    child: Consumer<HomeProvider>(builder: (context, value, child) {
      value.getThemeData();
      value.changeTheme();
      value.isTheme = value.isTheme;
      value.isOn == value.isTheme;
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: app_routes,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: value.mode,
      );
    }),
  ));
}
