//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:geolocator/geolocator.dart';
 import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:one_soul/constans.dart';
// import 'package:one_soul/dialogs/error_dialog.dart';
// import 'package:one_soul/dialogs/language_pick_dialog.dart';
// import 'package:one_soul/dialogs/success_dialog.dart';
// import 'package:one_soul/widgets/route_animation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:easy_localization/easy_localization.dart';
//
// import '../enums.dart';
//
//
final GlobalKey<ScaffoldMessengerState> snackBarKey =
GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navKey =
GlobalKey<NavigatorState>();

class NavigationApp{

  static void push(BuildContext context,Widget screen){
    Navigator.push(context,  MaterialPageRoute(builder: (context) => screen,) );
  }
  static void replace(BuildContext context,Widget screen){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screen,));
  }
  static void replaceAll(BuildContext context,Widget screen){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => screen,),(c)=>false);
  }
  static void back(BuildContext context){
    Navigator.pop(context);
  }

  static Future<dynamic> pushWithResult(BuildContext context,Widget screen)async{
  return  await Navigator.push(context,  MaterialPageRoute(builder: (context) => screen,) );
  }

}
//
//
// class UiMethods{
//   static Future showSuccessDialog(
//       {required BuildContext context, required VoidCallback onTap, required String text ,String doneText = "Done"})async{
//   await  showDialog(context: context, builder: (context) => SuccessDialog(onTap: onTap, text: text.tr(), doneText:doneText.tr(),),);
//   }
//
//   static showErrorDialog(
//       {required BuildContext context, required VoidCallback onTap, required String text ,String doneText = "Done"}){
//     showDialog(context: context, builder: (context) => ErrorDialog(onTap: onTap, text: text.toString().tr(), doneText:doneText.tr(),),);
//   }
//
//   static showLanguageDialog(
//       {required BuildContext context,}){
//     showDialog(context: context, builder: (context) => const LanguagePicker(),useRootNavigator:true );
//   }
//
//   static showSnackBar(
//       {  required String text ,required bool isError}){
//     final SnackBar snackBar = SnackBar(backgroundColor:isError?Colors.redAccent:Colors.green ,content:Text(text.toString().tr(),style: TextStyle(color: Colors.white),),behavior:SnackBarBehavior.floating ,);
//     snackBarKey.currentState?.showSnackBar(snackBar);
//   }
//   static showNoteSnackBar(
//       {  required String text , SnackBarBehavior behavior=SnackBarBehavior.floating}){
//     final SnackBar snackBar = SnackBar(backgroundColor:Colors.blueGrey ,content:Text(text.toString().tr(),style: TextStyle(color: Colors.white),),behavior:behavior,);
//     snackBarKey.currentState?.showSnackBar(snackBar);
//   }
//
//   static Future timePicker(context,help,UserTypes type){
//    return showTimePicker(
//       context: context,helpText: help,
//       initialTime: TimeOfDay.now(),builder: (context, child) => Theme(data: ThemeData(textTheme: TextTheme(overline: TextStyle(fontSize: 30)),
//         colorScheme:ColorScheme.fromSwatch(primarySwatch:type==UserTypes.foundation? Colors.pink:Colors.amber,accentColor:type==UserTypes.foundation?  Colors.pink.shade200:Colors.amber.shade200)
//     ),  child: child!),
//     );
//   }
//
//   static Future imageTypePick(context){
//    return showModalBottomSheet(context: context,isScrollControlled: false, builder: (context) => SizedBox(
//       height: 120,
//       child: Material(child: Column(
//         children: [
//           ListTile(onTap: () => Navigator.pop(context,0),leading: const Icon(Icons.camera),title: Text("Take a photo".tr()),),
//           ListTile(onTap: () => Navigator.pop(context,1),leading: const Icon(Icons.image_outlined),title:  Text("Pick from gallery".tr()),),
//         ],
//       ),),
//     ),);
//   }
// }
//
// class HelperMethods{
// static String format24Time(context,timeOfDay){
//   final localizations = MaterialLocalizations.of(context??navKey.currentContext!);
//   final formattedTimeOfDay = localizations.formatTimeOfDay(timeOfDay,alwaysUse24HourFormat: true);
//   return formattedTimeOfDay;
// }
//
//
// static Future<Position> determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return Future.error('Location services are disabled.');
//   }
//
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location permissions are denied');
//     }
//   }
//
//   if (permission == LocationPermission.deniedForever) {
//     // Permissions are denied forever, handle appropriately.
//     return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.');
//   }
//   Position? position = await Geolocator.getLastKnownPosition();
//
//   return position??
//       await Geolocator.getCurrentPosition( );
// }
// }
//
//
//
// class SocialLogin{
//
//  static Future<String?> signInWithGoogle() async {
//
//     // Trigger the authentication flow
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
//
//
//     return  googleAuth?.accessToken;
//   }
//
//  static Future<String?> signInWithFacebook() async {
//    // Trigger the sign-in flow
//    final LoginResult loginResult = await FacebookAuth.instance.login(loginBehavior:LoginBehavior.webOnly ,permissions: ['email']);
//
//    return loginResult.accessToken?.token;
//  }
//
//
// }
//
//
//
// class SharedPrefs{
//
//   static const token='token';
//
//   static late SharedPreferences prefs;
//
//   static Future sharedPrefInit() async {
//     try {
//       Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//       prefs = await _prefs;
//       prefs.getString("app-name");
//     } catch (err) {
//       UiMethods.showSnackBar(text: err.toString(), isError: true);
//     }
//   }
// }
//
