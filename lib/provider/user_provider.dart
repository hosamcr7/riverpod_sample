import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/global_models/user_model.dart';



final userProvider = ChangeNotifierProvider<UserProvider>((ref) => UserProvider());

class UserProvider extends ChangeNotifier{
  late UserModel _userModel;

  UserModel get userModel => _userModel;

  set userModel(UserModel value) {
    _userModel = value;
    notifyListeners();
  }
}