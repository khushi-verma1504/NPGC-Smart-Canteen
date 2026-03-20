import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npgc_smart_canteen/auth/formwidgets/loginsignup_button.dart';
import 'package:npgc_smart_canteen/auth/formwidgets/admin_id_field.dart';

class AdminLogin extends StatelessWidget{
  final TextEditingController adminidController;
  final VoidCallback onVerifyPhone;
  const AdminLogin({
    super.key,
    required this.adminidController,
    required this.onVerifyPhone,
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
            child: Text('Enter Admin ID:', style: Theme.of(context).textTheme.titleMedium),
          ),
          Container(
              margin: EdgeInsets.only(left: 10, top: 5, right: 10),
              height: 45,
              decoration: BoxDecoration(
                  color: Color(0xffB3BFCB).withAlpha(125),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: AdminIdField(adminidController: adminidController)
          ),
          LoginPhoneButton(onVerifyPhone: onVerifyPhone,)
        ],
      ),
    );
  }

}