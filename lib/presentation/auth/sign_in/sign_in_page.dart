import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitclic/presentation/auth/sign_in/sign_in_controller.dart';
import 'package:gitclic/presentation/auth/sign_in/sign_in_widgets/sign_up_form_widget.dart';
import 'package:gitclic/presentation/routes/app_pages.dart';
import 'package:lottie/lottie.dart';
import 'package:gitclic/presentation/themes/app_text_styles.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //Instance SignUpController
  final SignInController signInController = Get.put(SignInController());
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
          signInController: signInController,
          emailController: emailController,
          pwdController: pwdController,
        ));
  }
}

//SignUp body content
class _SignUpBody extends StatefulWidget {
  const _SignUpBody({
    required this.size,
    required this.signInController,
    required this.emailController,
    required this.pwdController,
  });
  final TextEditingController emailController;
  final TextEditingController pwdController;

  final Size size;
  final SignInController signInController;

  @override
  State<_SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<_SignUpBody> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //Instance for listen signUpController
    final signInController = Get.find<SignInController>();

    //Intance Modal TextEditing controller email
    final TextEditingController emailControllerPwdRecovery =
        TextEditingController();

    //Scroll is used to auto scroll when user uses textformfield
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
                child: Lottie.asset('assets/animations/sign_in_animation.json',
                    height: size.height * 0.3),
              ),
            ),
            20.verticalSpace,

            const SizedBox(
              height: 24,
            ),

            //Sign up title
            Text('Sign in', style: TextStyles.titleMedium()),
            20.verticalSpace,
            //Sign up title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Type your email/password',
                  style: TextStyles.bodySmall()),
            ),
            20.verticalSpace,

            //Form to get user data
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  //This is a custom Form for email and password inputs
                  CustomSignInForm(
                      email: widget.emailController,
                      pwd: widget.pwdController,
                      signInController: signInController,
                      size: size),

                  20.verticalSpace,

                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () async {
                        await widget.signInController.onLogin();

                        if (widget.signInController.formKey.currentState!
                            .validate()) {
                          widget.signInController.email.value =
                              widget.emailController.text;
                          widget.signInController.password.value =
                              widget.pwdController.text;
                          // widget.signUpController.signUp();
                        } else {
                          return;
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text('Send',
                            style: TextStyles.labelLarge(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            20.verticalSpace,

            //This password recovery modal
            TextButton(
                onPressed: () {
                  //Obx update
                  Get.dialog(
                    Obx(
                      () {
                        return AlertDialog(
                          title: const Text('Password recovery'),
                          content: const Text('Please type your email'),
                          actions: [
                            Form(
                              key: signInController.formKeyPwdRecovery,
                              child: TextFormField(
                                controller: emailControllerPwdRecovery,
                                validator: (value) => widget.signInController
                                    .validateEmail(value),
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    errorMaxLines: 5,
                                    label: Text('Email'),
                                    prefixIcon: Icon(Icons.email)),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                //await signInController.onLogin();
                                /*if (signInController
                                    .formKeyPwdRecovery.currentState!
                                    .validate()) {
                                  //Save email pwd recovery to obs variable
                                  signInController.emailRecoveryWithToken
                                      .value = emailControllerPwdRecovery.text;
                                } else {
                                  return;
                                }*/
                                Get.toNamed(Approutes.signInRecoveryPage);
                              },
                              child:
                                  signInController.loadingRedirecting.value ==
                                          true
                                      ? const CircularProgressIndicator()
                                      : const Text('Send'),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
                child: const Text('Forgot password?')),

            //This is a Padding using MediaQuery for when keyboard raised
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom)),
          ],
        ),
      )),
    );
  }
}
