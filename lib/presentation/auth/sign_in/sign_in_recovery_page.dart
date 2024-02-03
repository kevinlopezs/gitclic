import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitclic/presentation/auth/sign_in/sign_in_controller.dart';
import 'package:lottie/lottie.dart';

class SignInRecoveryPage extends StatefulWidget {
  static const name = 'signup_verification_screen';
  const SignInRecoveryPage({super.key});

  @override
  State<SignInRecoveryPage> createState() => _SignInRecoveryPageState();
}

class _SignInRecoveryPageState extends State<SignInRecoveryPage> {
  //Instance SignUpController
  final SignInController signInController = Get.find();
  //Instance TextEditing controller token
  final TextEditingController tokenController = TextEditingController();
  //Intance TextEditing controller email
  final TextEditingController emailController = TextEditingController();
  //Instance TextEditing controller pwds
  final TextEditingController pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //Instance for colors apptheme
    final colors = Theme.of(context).colorScheme;
    //Instance for fonts apptheme
    final fonts = Theme.of(context).textTheme;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xfff7f6fb),
        body: _SignInRecoveryBody(
          colors: colors,
          fonts: fonts,
          emailController: emailController,
          pwdController: pwdController,
          signInController: signInController,
          tokenController: tokenController,
        ));
  }
}

class _SignInRecoveryBody extends StatefulWidget {
  const _SignInRecoveryBody(
      {required this.colors,
      required this.fonts,
      required this.signInController,
      required this.emailController,
      required this.pwdController,
      required this.tokenController});

  final ColorScheme colors;
  final TextTheme fonts;
  final SignInController signInController;
  final TextEditingController tokenController;
  final TextEditingController emailController;
  final TextEditingController pwdController;

  @override
  State<_SignInRecoveryBody> createState() => _SignInRecoveryBodyState();
}

class _SignInRecoveryBodyState extends State<_SignInRecoveryBody> {
  @override
  Widget build(BuildContext context) {
    //Device screen size
    final size = MediaQuery.of(context).size;
    //Instance for listen signUpController
    final signInController = Get.find<SignInController>();

    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                  color: widget.colors.primaryContainer,
                  shape: BoxShape.circle),
              child: Lottie.asset(
                  'assets/animations/sign_in_recovery_animation.json',
                  alignment: Alignment.centerRight),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text('Recover your account', style: widget.fonts.titleMedium),
          const SizedBox(height: 10),
          Text(
            'Type your token and new password',
            style: widget.fonts.titleSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(children: [
              _CustomTextFormFieldSignIn(
                  colors: widget.colors,
                  fonts: widget.fonts,
                  size: size,
                  signInController: signInController,
                  token: widget.tokenController,
                  email: widget.emailController,
                  pwd: widget.pwdController),
              const SizedBox(
                height: 12,
              ),

              //Sign in button
              Obx(() {
                return SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0)))),
                      onPressed: () async {
                        if (signInController
                            .formKeyPwdRecoveryPageWithToken.currentState!
                            .validate()) {
                          /*signInController.updatePwdRecovery(
                            email:
                                signInController.emailRecoveryWithToken.value,
                            token: widget.tokenController.text,
                            newPwd: widget.pwdController.text,
                          );*/
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: signInController.loadingPwdRecovery.value == true
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text('Sign in'),
                      )),
                );
              })
              //Button verify OTP auth
            ]),
          ),

          const SizedBox(
            height: 12,
          ),

          const SizedBox(
            height: 1,
          ),

          //This is a Padding using MediaQuery for when keyboard raised
          Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom)),
        ],
      ),
    ));
  }
}

//Custom TextFormField SignUp body content
class _CustomTextFormFieldSignIn extends StatefulWidget {
  const _CustomTextFormFieldSignIn({
    required this.colors,
    required this.fonts,
    required this.size,
    required this.signInController,
    required this.email,
    required this.pwd,
    required this.token,
  });

  final TextEditingController token;
  final TextEditingController email;
  final TextEditingController pwd;
  final SignInController signInController;
  final ColorScheme colors;
  final TextTheme fonts;
  final Size size;

  @override
  State<_CustomTextFormFieldSignIn> createState() =>
      _CustomTextFormFieldSignInState();
}

class _CustomTextFormFieldSignInState
    extends State<_CustomTextFormFieldSignIn> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.signInController.formKeyPwdRecoveryPageWithToken,
      child: Column(
        children: [
          SizedBox(
            width: widget.size.width,
            child: TextFormField(
              controller: widget.token,
              validator: (token) =>
                  widget.signInController.validateToken(token),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                errorMaxLines: 5,
                label: Text('Token'),
                prefixIcon: Icon(Icons.password_outlined),
              ),
              onChanged: (value) {
                setState(() {
                  widget.email.text = value;
                });
              },
            ),
          ),
          20.verticalSpace,
          SizedBox(
            width: widget.size.width,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                label:
                    Text(widget.signInController.emailRecoveryWithToken.value),
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              readOnly: true,
              enabled: false,
            ),
          ),
          20.verticalSpace,
          SizedBox(
            width: widget.size.width,
            child: TextFormField(
              style: const TextStyle(overflow: TextOverflow.visible),
              validator: (pwd) => widget.signInController.validatePass(pwd),
              obscureText: !_isPasswordVisible,
              controller: widget.pwd,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                errorMaxLines: 5,
                label: const Text('New password'),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: InkWell(
                  child: Icon(_isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onTap: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              onChanged: (value) {
                setState(() {
                  widget.pwd.text = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
