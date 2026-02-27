import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:npgc_smart_canteen/auth/screens//forms/formwidgets/email_field.dart';
import 'package:npgc_smart_canteen/auth/screens//forms/formwidgets/login_button.dart';
import 'package:npgc_smart_canteen/auth/screens//forms/formwidgets/password_field.dart';

class StudentEmailLoginForm extends StatelessWidget{
  final TextEditingController emailController;
  final TextEditingController passController;

  const StudentEmailLoginForm({
    super.key,
    required this.emailController,
    required this.passController
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text('Enter Your Email:', style: Theme.of(context).textTheme.titleMedium),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 5, right: 10),
            height: 45,
            decoration: BoxDecoration(
              color: Color(0xffB3BFCB).withAlpha(125),
              borderRadius: BorderRadius.circular(20)
            ),
            child: EmailField(emailController: emailController)
          ),
          PasswordField(passController: passController),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {}, // empty for now
              child: Text(
                "Forgot password?",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ),
          LoginEmailButton()
        ],
      ),
    );
  }

}