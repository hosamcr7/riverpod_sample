import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/animations/fade_animation.dart';

import 'login_state.dart';



final loginStateProvider = ChangeNotifierProvider.autoDispose((ref) => LoginState());

class LoginScreen extends ConsumerWidget  {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context,  ref) {
    final provider= ref.watch(loginStateProvider);

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const _LoginHeader(),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: provider.formKey,
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(1.8, Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade100))
                              ),
                              child: TextFormField(
                                initialValue: provider.email,
                                onSaved: (newValue) => provider.email=newValue??'',
                                validator: (value) {
                                  if(value==null||value.isEmpty){return 'enter data';}
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email or Phone number",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                initialValue: provider.password,
                                onSaved: (newValue) => provider.password=newValue??'',
                                validator: (value) {
                                  if(value==null||value.isEmpty){return 'enter data';}
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                      const SizedBox(height: 30,),
                      provider.loading?
                      const Center(child:  CircularProgressIndicator())
                      :InkWell(
                        onTap: () => provider.onLogin(context,ref),
                        child: FadeAnimation(2, Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ]
                              )
                          ),
                          child: const Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        )),
                      ),
                      const SizedBox(height: 70,),
                      FadeAnimation(1.5, const Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }

}

class _LoginHeader extends StatelessWidget {
  const _LoginHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill
          )
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 30,
            width: 80,
            height: 200,
            child: FadeAnimation(1, Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/light-1.png')
                  )
              ),
            )),
          ),
          Positioned(
            left: 140,
            width: 80,
            height: 150,
            child: FadeAnimation(1.3, Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/light-2.png')
                  )
              ),
            )),
          ),
          Positioned(
            right: 40,
            top: 40,
            width: 80,
            height: 150,
            child: FadeAnimation(1.5, Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/clock.png')
                  )
              ),
            )),
          ),
          Positioned(
            child: FadeAnimation(1.6, Container(
              margin: EdgeInsets.only(top: 50),
              child: Center(
                child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
              ),
            )),
          )
        ],
      ),
    );
  }
}
