


import 'dart:math';

import 'package:riverpod_sample/global_models/user_model.dart';

import 'package:riverpod_sample/screens/posts/post_model.dart';
import 'package:riverpod_sample/services/api_requests.dart';

class LoginRepo{

  Future<UserModel> login(UserModel body)async{
    try{
     await Future.delayed(Duration(seconds: 3));
      //return Future.error("error");
      return UserModel(
          email: body.email,
          id: Random().nextInt(30),
          name: 'name'+Random().nextInt(5).toString(),
          token: '',
          phone: Random().nextInt(30).toString()
      );
    }catch(e){
      throw e.toString();
    }
  }

}