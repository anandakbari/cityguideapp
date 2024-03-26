import 'controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:city_guide_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends GetWidget<SignUpController> {

  final controller=Get.put(SignUpController());


  @override
  Widget build(BuildContext context) {
    return Form(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Form(
                        key: controller.signupFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomIconButton(
                                  height: 44,
                                  width: 44,
                                  margin:
                                      getMargin(left: 20, top: 8, right: 20),
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
                                      child: Text("Sign Up now".tr,
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
                                      child: Text("".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtSFUIDisplayRegular16
                                              .copyWith(height: 1.00)))),
                              CustomTextFormField(
                                  width: 335,
                                  focusNode: FocusNode(),
                                  controller:
                                      controller.usernameController,
                                  hintText: "Username".tr,
                                  margin:
                                      getMargin(left: 20, top: 40, right: 20),
                                  alignment: Alignment.center,
                                prefix: IconButton(
                                  icon: Icon(Icons.person,color: Colors.black,),
                                  onPressed: () {

                                  },
                                ),


                              ),
                              CustomTextFormField(
                                  width: 335,
                                  focusNode: FocusNode(),
                                  controller: controller.emailController,
                                  hintText: "Email".tr,
                                  margin:
                                      getMargin(left: 20, top: 40, right: 20),
                                  textInputAction: TextInputAction.done,
                                  alignment: Alignment.center,
                                  prefix: IconButton(
                                    icon: Icon(Icons.email_sharp,color: Colors.black,),
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
                              CustomButton(
                                  width: 335,
                                  text: "Sign Up".tr,
                                  margin:
                                      getMargin(left: 20, top: 40, right: 20),
                                  alignment: Alignment.center,
                                  onTap: (){
                                    controller.onSignUp();
                                  },
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
                                            Text("Already have an account?".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtSFUIDisplayRegular14
                                                    .copyWith(height: 1.00)),
                                            InkWell(
                                              onTap: () {
                                                Get.toNamed(
                                                    AppRoutes.signInScreen);
                                              },
                                              child: Padding(
                                                  padding: getPadding(left: 8),
                                                  child: Text("Sign In".tr,
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
                                      child: Text("Or".tr,
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
                                          top: 36,
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
