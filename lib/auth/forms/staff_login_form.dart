import 'package:flutter/cupertino.dart';
import 'package:npgc_smart_canteen/auth/formwidgets/loginsignup_button.dart';
import 'package:npgc_smart_canteen/auth/formwidgets/profile_name_field.dart';
import 'package:flutter/material.dart';
import 'package:npgc_smart_canteen/auth/formwidgets/staff_employment_id.dart';

class StaffLoginForm extends StatelessWidget{
  final TextEditingController nameController;
  final TextEditingController empidController;
  final VoidCallback onVerifyPhone;

  const StaffLoginForm({
    super.key,
    required this.nameController,
    required this.empidController,
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
            child: Text('Enter Your FullName:', style: Theme.of(context).textTheme.titleMedium),
          ),
          Container(
              margin: EdgeInsets.only(left: 10, top: 5, right: 10),
              height: 45,
              decoration: BoxDecoration(
                  color: Color(0xffB3BFCB).withAlpha(125),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: ProfileName(nameController: nameController)
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Text('Enter Employment ID:', style: Theme.of(context).textTheme.titleMedium),
          ),
          Container(
              margin: EdgeInsets.only(left: 10, top: 5, right: 10),
              height: 45,
              decoration: BoxDecoration(
                  color: Color(0xffB3BFCB).withAlpha(125),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: StaffEmpId(empidController: empidController)
          ),
          LoginPhoneButton(onVerifyPhone: onVerifyPhone,)
        ],
      ),
    );
  }

}