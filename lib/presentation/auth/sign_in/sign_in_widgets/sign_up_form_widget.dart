import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitclic/presentation/auth/sign_in/sign_in_controller.dart';

class CustomSignInForm extends StatefulWidget {
  final TextEditingController email;
  final TextEditingController pwd;
  final SignInController signInController;
  final Size size;

  const CustomSignInForm(
      {super.key,
      required this.email,
      required this.pwd,
      required this.signInController,
      required this.size});

  @override
  State<CustomSignInForm> createState() => _CustomSignInFormState();
}

class _CustomSignInFormState extends State<CustomSignInForm> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.signInController.formKey,
      child: Column(
        children: [
          SizedBox(
            width: widget.size.width,
            child: TextFormField(
              controller: widget.email,
              validator: (email) =>
                  widget.signInController.validateEmail(email),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                label: Text('Email'),
                prefixIcon: Icon(Icons.email_outlined),
              ),
              onChanged: (value) {
                widget.email.text = value;
              },
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
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
                label: const Text('Password'),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: InkWell(
                  child: Icon(_isPasswordVisible == true
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
                widget.pwd.text = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
