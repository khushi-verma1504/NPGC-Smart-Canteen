import 'package:flutter/material.dart';
import 'package:npgc_smart_canteen/auth/screens//forms/staff_login_form.dart';
import 'package:npgc_smart_canteen/auth/screens//forms/student_email_form.dart';
import 'package:npgc_smart_canteen/auth/screens//forms/student_phone_form.dart';
import 'package:npgc_smart_canteen/auth/screens/forms/admin_login_form.dart';
import 'package:npgc_smart_canteen/auth/screens/forms/formwidgets/login_method.dart';
import 'package:npgc_smart_canteen/auth/screens/forms/formwidgets/profile_icon.dart';
import 'package:npgc_smart_canteen/auth/screens/forms/formwidgets/role_selector.dart';
import 'package:npgc_smart_canteen/auth/screens/forms/social_login_form.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedMethod = "Email";
  String selectedRole = "Student";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController empidController = TextEditingController();
  final TextEditingController adminidController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    phoneController.dispose();
    nameController.dispose();
    empidController.dispose();
    adminidController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileIcon(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('Welcome Back!', style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.only( bottom: 4),
              child: Text('Login to order your favourite meals.', style: Theme.of(context).textTheme.headlineSmall),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, bottom: 10),
              child: Align(
                alignment: Alignment.center,
                  child: Text(
                      'Select Your Role:',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 14))),
            ),
          RoleSelector(
            selectedRole: selectedRole,
            onRoleSelected: (role) {
              setState(() {
                selectedRole = role;
              });
            },
          ),
            if(selectedRole=='Student')
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
              child: LoginMethod(
                selectedMethod: selectedMethod,
                onMethodChanged: (method) {
                  setState(() {
                    selectedMethod = method;
                  });
                },
              ),
            ),
            if(selectedRole == "Student" && selectedMethod == "Email")
               StudentEmailLoginForm(emailController: emailController, passController: passController,)
            else if(selectedRole == "Student" && selectedMethod == "Phone")
              StudentPhoneLoginForm(phoneController: phoneController, passController: passController)
            else if(selectedRole=='Staff')
              StaffLoginForm(nameController: nameController, empidController: empidController)
            else
              AdminLogin(adminidController: adminidController),
            SocialLogin(),
            SizedBox(height: 15,),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.orange, // text color
                textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: "TitleMedium"
                ),
              ),
              onPressed: (){

              },
              child: const Text("Don't have an Account? SignUp"),
            )
          ],
        ),
      ),
    );
  }

}
