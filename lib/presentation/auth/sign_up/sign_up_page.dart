import 'package:gitclic/presentation/auth/sign_up/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitclic/presentation/auth/sign_up/sign_up_widgets/sign_up_form_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:gitclic/presentation/themes/app_text_styles.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //Instance SignUpController
  final SignUpController signUpController = Get.put(SignUpController());
  //Intance TextEditing controller email
  final TextEditingController emailController = TextEditingController();
  //Instance TextEditing controller pwds
  final TextEditingController pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //Instance for mediaquery size
    final size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xfff7f6fb),
        body: _SignUpBody(
          size: size,
          signUpController: signUpController,
          emailController: emailController,
          pwdController: pwdController,
        ));
  }
}

//SignUp body content
class _SignUpBody extends StatefulWidget {
  const _SignUpBody({
    required this.size,
    required this.signUpController,
    required this.emailController,
    required this.pwdController,
  });
  final TextEditingController emailController;
  final TextEditingController pwdController;

  final Size size;
  final SignUpController signUpController;

  @override
  State<_SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<_SignUpBody> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //Scroll is used to auto scroll when user uses textformfield
    return GetBuilder<SignUpController>(
        id: 'signUpPage',
        builder: (signUpController) {
          return SizedBox(
            height: size.height,
            width: size.width,
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              child: Column(
                children: [
                  //Icon go back
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 32,
                        color: Get.theme.iconTheme.color,
                      ),
                    ),
                  ),

                  //Lottie animation
                  //An Expanded added to not use SingleChildScrollView
                  Expanded(
                    child: Container(
                      height: size.height * 0.3,
                      decoration: BoxDecoration(
                          color: Get.theme.secondaryHeaderColor,
                          shape: BoxShape.circle),
                      child: Lottie.asset(
                          'assets/animations/sign_up_animation.json',
                          height: size.height * 0.3),
                    ),
                  ),
                  20.verticalSpace,

                  const SizedBox(
                    height: 24,
                  ),

                  //Sign up title
                  Text('Sign up', style: TextStyles.titleMedium()),
                  20.verticalSpace,
                  //Sign up title
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Please add an email and password. We send to your email a link to verify the account',
                        style: TextStyles.bodySmall()),
                  ),
                  20.verticalSpace,

                  //Form to get user data
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        //This is a custom Form for email and password inputs
                        CustomSignUpForm(
                            email: widget.emailController,
                            pwd: widget.pwdController,
                            signUpController: signUpController,
                            size: size),

                        20.verticalSpace,

                        //Is neccesary to wrap the button into a obx to show circular progress indicator
                        Obx(() {
                          //Button for create a new user
                          return SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () async {
                                await widget.signUpController.onLogin();

                                if (widget
                                    .signUpController.formKey.currentState!
                                    .validate()) {
                                  //Send arguments email and password to controller
                                  widget.signUpController.email.value =
                                      widget.emailController.text;
                                  widget.signUpController.password.value =
                                      widget.pwdController.text;

                                  //Create a new user
                                  widget.signUpController.signUp();
                                } else {
                                  return;
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child:
                                    //This condition checks if auth service is loading
                                    //and shows a loading for the user
                                    signUpController.loadingAuth.value == true
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Text('Send',
                                            style: TextStyles.labelLarge(
                                                color: Colors.white)),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  ),

                  //This is a Padding using MediaQuery for when keyboard raised
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom)),
                ],
              ),
            )),
          );
        });
  }
}
