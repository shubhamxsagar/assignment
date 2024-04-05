import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getlocalStorage =
    ChangeNotifierProvider<LocalStorageRepository>((ref) => LocalStorageRepository());

class LocalStorageRepository extends ChangeNotifier {
  void setUser(String user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('user', user);
  }
  Future<String> getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString('user') ?? '';
    return token;
  }
}
