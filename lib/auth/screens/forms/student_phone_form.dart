import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npgc_smart_canteen/auth/screens//forms/formwidgets/login_button.dart';
import 'package:npgc_smart_canteen/auth/screens//forms/formwidgets/phone_field.dart';

class StudentPhoneLoginForm extends StatelessWidget{
  final TextEditingController phoneController;
  final TextEditingController passController;
  const StudentPhoneLoginForm({
    super.key,
    required this.phoneController,
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
            child: Text('Enter Your Phone Number:', style: Theme.of(context).textTheme.titleMedium),
          ),
          Container(
              margin: EdgeInsets.only(left: 10, top: 5, right: 10),
              height: 45,
              decoration: BoxDecoration(
                  color: Color(0xffB3BFCB).withAlpha(125),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: PhoneField(phoneController: phoneController)
          ),

          LoginPhoneButton()
        ],
      ),
    );
  }

}