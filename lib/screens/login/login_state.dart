import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_sample/global_models/user_model.dart';
import 'package:riverpod_sample/provider/user_provider.dart';
import 'package:riverpod_sample/screens/posts/posts_screen.dart';
import 'package:riverpod_sample/services/helper_methods.dart';

import 'login_repo.dart';

class LoginState extends ChangeNotifier {

  UserModel userModel=UserModel();
  final formKey = GlobalKey<FormState>();
  String email='';
  String password='';
  bool _hidePassword=true;
  bool loading=false;
  late final LoginRepo loginRepo;

  LoginState(){
    loginRepo=LoginRepo();
  }

  bool validateForm(){
    formKey.currentState?.save();
    return formKey.currentState?.validate()??false;
  }

  void onLogin(BuildContext context, WidgetRef ref)async{
    if(validateForm()){
      UserModel? loginModel;
      setLoading=true;
      try {
         loginModel=  await loginRepo.login(userModel.copyWith(email: email));
      } catch (e) {
        print(e.toString());
      }
      finally{
        setLoading=false;
      }
      if(loginModel!=null){
        // context.read(userProvider).userModel=loginModel;
        ref.read(userProvider).userModel=loginModel;
        NavigationApp.push(context, PostsScreen());
      }
    }

  }

  set setLoading(bool l){
    loading=l;
    notifyListeners();
  }

}