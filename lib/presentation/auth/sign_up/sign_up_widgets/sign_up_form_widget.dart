import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitclic/presentation/auth/sign_up/sign_up_controller.dart';

class CustomSignUpForm extends StatefulWidget {
  final TextEditingController email;
  final TextEditingController pwd;
  final SignUpController signUpController;
  final Size size;

  const CustomSignUpForm(
      {super.key,
      required this.email,
      required this.pwd,
      required this.signUpController,
      required this.size});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.signUpController.formKey,
      child: Column(
        children: [
          SizedBox(
            width: widget.size.width,
            child: TextFormField(
              controller: widget.email,
              validator: (email) =>
                  widget.signUpController.validateEmail(email),
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
              validator: (pwd) => widget.signUpController.validatePass(pwd),
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
