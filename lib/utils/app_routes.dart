import 'package:flutter/material.dart';
import 'package:galaxy_planets/screen/detail/view/detail_screen.dart';
import 'package:galaxy_planets/screen/favorite/view/favorite_screen.dart';
import 'package:galaxy_planets/screen/home/view/home_screen.dart';
import 'package:galaxy_planets/screen/splash/view/splash_screen.dart';

Map<String , WidgetBuilder> app_routes ={
  '/':(context) =>const SplashScreen(),
  'home':(context) =>const HomeScreen(),
  'detail':(context) =>const DetailScreen(),
  'favorite':(context) =>const FavoriteScreen(),
};