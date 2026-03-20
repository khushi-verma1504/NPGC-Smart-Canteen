import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:npgc_smart_canteen/auth/forms/student_email_form.dart';
import 'package:npgc_smart_canteen/auth/forms/student_phone_form.dart';
import 'package:npgc_smart_canteen/auth/formwidgets/login_method.dart';
import 'package:npgc_smart_canteen/auth/formwidgets/profile_icon.dart';
import 'package:npgc_smart_canteen/auth/forms/social_login_form.dart';
import 'package:npgc_smart_canteen/auth/screens/login_screen.dart';
import 'package:npgc_smart_canteen/services/auth_service.dart';
import 'package:npgc_smart_canteen/auth/screens/phone_otp_screen.dart';


class SignUpScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>{
  String selectedMethod = "Email";
  String selectedRole = "Student";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController empidController = TextEditingController();
  final TextEditingController adminidController = TextEditingController();
  Future<void> _verifyPhoneNumber() async {

    String phone = phoneController.text.trim();

    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Enter phone number"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    await AuthService().verifyPhoneNumber(
      phoneNumber: "+91$phone",

      codeSent: (verificationId) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OtpScreen(verificationId: verificationId),
          ),
        );
      },

      verificationFailed: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        );
      },
    );
  }
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
              child: Text('NPGC SmartCanteen Welcomes!', style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w500,), textAlign: TextAlign.center,),
            ),
            Padding(
              padding: const EdgeInsets.only( bottom: 4),
              child: Text('Join in to order your favourite meals.', style: Theme.of(context).textTheme.headlineSmall),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, bottom: 10),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                      'Select Your Role:',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 14))),
            ),
            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              child: Ink(
                height: 95,
                width: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 4,
                    color: Colors.orange
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Student.svg',
                        height: 40,
                        width: 40,
                      ),
                      Text(
                        'Student',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
              ),
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
            if(selectedMethod == "Email")
              StudentEmailSignUpForm(nameController: nameController, emailController: emailController, passController: passController, onSignUp: () async{
               try{
                 await AuthService().signUpWithEmail(emailController.text, passController.text);
                 print("SignUp Successful");
                 ScaffoldMessenger.of(context).showSnackBar(
                   const SnackBar(content: Text('SignUp Successful!')),
                 );
                 // Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
               } catch(e){
                 print("SignUp Failed: $e");
                 ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(content: Text("Error: $e")),
                 );
               }
              })
            else
              StudentPhoneSignUpForm(nameController: nameController, phoneController: phoneController, passController: passController, onVerifyPhone: _verifyPhoneNumber,),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: const Text("Already have an Account? Login"),
            )
          ],
        ),
      ),
    );
  }


}