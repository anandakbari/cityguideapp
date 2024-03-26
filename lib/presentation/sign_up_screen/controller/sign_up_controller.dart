import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '/core/app_export.dart';
import 'package:city_guide_app/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:flutter/material.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> signupFormKey=GlobalKey<FormState>();
  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;
  var isPasswordVisible = false.obs;
  final FirebaseAuth _auth=FirebaseAuth.instance;


  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    emailController.dispose();
  }

  void onSignUp(){
    print(usernameController.text);
    print(passwordController.text);
    print(emailController.text);
    print("sign up request");
    createAccount(emailController.text, passwordController.text);
  }

  Future<void> createAccount(String email,String password) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      Get.toNamed(AppRoutes.signInScreen);
      Fluttertoast.showToast(
        msg: "Account Created",
        backgroundColor: Colors.pink[300]
      );
    } on FirebaseAuthException catch(ex){
      if(ex.code=="weak-password"){
        Fluttertoast.showToast(
            msg: "Weak password",
            backgroundColor: Colors.red
        );
      }
      else if(ex.code=="email-already-in-use"){
        Fluttertoast.showToast(
            msg: "Email already in use",
            backgroundColor: Colors.red,
            gravity: ToastGravity.TOP
        );
      }
      
    }
    catch(ex){
      print(ex);
    }
    
  }
}
