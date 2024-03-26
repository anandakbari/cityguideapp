import 'package:city_guide_app/presentation//sign_in_screen/controller/sign_in_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:city_guide_app/widgets/custom_button.dart';
import 'package:city_guide_app/widgets/custom_icon_button.dart';
import 'package:city_guide_app/widgets/custom_text_from_field.dart';
import 'package:city_guide_app/widgets/common_image_view.dart';
import 'package:city_guide_app/core/app_export.dart';
import 'package:city_guide_app/theme/app_style.dart';

import '../../routes/app_routes.dart';

class SignInScreen extends GetWidget<SignInController> {
  final controller=Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Form(
                        key: controller.signInFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomIconButton(
                                  height: 44,
                                  width: 44,
                                  margin:
                                  getMargin(left: 20, top: 8, right: 20),
                                  alignment: Alignment.centerLeft,
                                  onTap: () {
                                    onTapBtntf();
                                  },
                                  child: CommonImageView(
                                      svgPath: ImageConstant.imgArrowleft)),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: getPadding(
                                          left: 20, top: 40, right: 20),
                                      child: Text("Sign In".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSFUIDisplaySemibold26
                                              .copyWith(height: 1.00)))),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: getPadding(
                                          left: 20, top: 12, right: 20),
                                      child: Text("Sign in to continue".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSFUIDisplayRegular16
                                              .copyWith(height: 1.00)))),
                              CustomTextFormField(
                                  width: 335,
                                  focusNode: FocusNode(),
                                  controller: controller.emailController,
                                  hintText: "johndoe@gmail.com".tr,
                                  margin:
                                  getMargin(left: 20, top: 40, right: 20),
                                  textInputAction: TextInputAction.done,
                                  alignment: Alignment.center,
                                  prefix: IconButton(
                                    icon: Icon(Icons.email,color: Colors.black,),
                                    onPressed: () {

                                    },
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      return "Please enter valid email";
                                    }
                                    return null;
                                  }),
                              CustomTextFormField(
                                  width: 335,
                                  focusNode: FocusNode(),
                                  controller:
                                  controller.passwordController,
                                  hintText: "Password".tr,
                                  margin:
                                  getMargin(left: 20, top: 40, right: 20),
                                  alignment: Alignment.center,
                                  prefix: IconButton(
                                    icon: Icon(Icons.password,color: Colors.black,),
                                    onPressed: () {

                                    },
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidPassword(value,
                                            isRequired: true))) {
                                      return "Please enter valid password";
                                    }}
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                          AppRoutes.forgotPasswordScreen);
                                    },
                                    child: Padding(
                                        padding: getPadding(
                                            left: 20, top: 16, right: 20),
                                        child: Text("Forgot password".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtSFUIDisplayMedium14
                                                .copyWith(height: 1.00))),
                                  )),
                              CustomButton(
                                  onTap: () {
                                    controller.onLogIn();
                                  },
                                  width: 335,
                                  text: "Sign In".tr,
                                  margin:
                                  getMargin(left: 20, top: 40, right: 20),
                                  alignment: Alignment.center,

                              ),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: getPadding(
                                          left: 20, top: 40, right: 20),
                                      child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text("Don't have a account?".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtSFUIDisplayRegular14
                                                    .copyWith(height: 1.00)),
                                            InkWell(
                                              onTap: () {
                                                Get.toNamed(
                                                    AppRoutes.signUpScreen);
                                              },
                                              child: Padding(
                                                  padding: getPadding(left: 8),
                                                  child: Text("Sign up".tr,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtSFUIDisplayMedium14
                                                          .copyWith(
                                                          height: 1.00))),
                                            )
                                          ]))),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: getPadding(
                                          left: 20, top: 20, right: 20),
                                      child: Text("Or connect with".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSFUIDisplayRegular14
                                              .copyWith(height: 1.00)))),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: getPadding(
                                          left: 20,
                                          top: 100,
                                          right: 20,
                                          bottom: 5),
                                      child: CommonImageView(
                                          imagePath: ImageConstant.imgGroup335,
                                          height: getVerticalSize(44.00),
                                          width: getHorizontalSize(172.00))))
                            ]))))));
  }

  onTapBtntf() {
    Get.back();
  }
}
