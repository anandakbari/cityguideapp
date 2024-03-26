import 'package:city_guide_app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/sign_in_model.dart';


class SignInController extends GetxController{
  static SignInController get instance => Get.find();
  var successfullSignIn=false.obs;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  GlobalKey<FormState> signInFormKey=GlobalKey<FormState>();
  final FirebaseAuth _auth=FirebaseAuth.instance;

  Rx<SignInModel> signInModelObj=SignInModel().obs;



  void onLogIn(){
    print(emailController.text);
    print(passwordController.text);
    signIntoAccount(emailController.text, passwordController.text);
  }

  Future<void> signIntoAccount(String email,String password) async{
    try{
      final credential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Get.toNamed(AppRoutes.homeScreen);
      Fluttertoast.showToast(
          msg: "Sign In successfully",
          backgroundColor: Colors.pink[300],

      );
      successfullSignIn=true.obs;
    } on FirebaseAuthException catch(ex){
      if(ex.code=="user-not-found"){
        Fluttertoast.showToast(
            msg: "Email does not exist",
            backgroundColor: Colors.red
        );
      }
      else if(ex.code=="wrong-password"){
        Fluttertoast.showToast(
            msg: "Wrong password",
            backgroundColor: Colors.red
        );
      }
    }
    catch(ex){
      print(ex);
    }

  }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //
  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken.token);
  //
  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }
  //
  // void googlelogin(){
  //   signInWithGoogle();
  // }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}