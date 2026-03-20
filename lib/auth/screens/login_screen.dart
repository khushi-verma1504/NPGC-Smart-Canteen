import 'package:flutter/material.dart';
import 'package:npgc_smart_canteen/auth/forms/staff_login_form.dart';
import 'package:npgc_smart_canteen/auth/forms/student_email_form.dart';
import 'package:npgc_smart_canteen/auth/forms/student_phone_form.dart';
import 'package:npgc_smart_canteen/auth/forms/admin_login_form.dart';
import 'package:npgc_smart_canteen/auth/formwidgets/login_method.dart';
import 'package:npgc_smart_canteen/auth/formwidgets/profile_icon.dart';
import 'package:npgc_smart_canteen/auth/formwidgets/role_selector.dart';
import 'package:npgc_smart_canteen/auth/forms/social_login_form.dart';
import 'package:npgc_smart_canteen/auth/screens/phone_otp_screen.dart';
import 'package:npgc_smart_canteen/auth/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:npgc_smart_canteen/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  String? _verificationId;

  Future<String?> getPhoneFromEmpId(String empid) async {
    final query = await FirebaseFirestore.instance
        .collection('staff')
        .where('empid', isEqualTo: empid)
        .get();

    if (query.docs.isNotEmpty) {
      return query.docs.first['phone'];
    }
    return null;
  }

  Future<String?> getPhoneFromAdminId(String adminId) async {
    final query = await FirebaseFirestore.instance
        .collection('admin')
        .where('adminId', isEqualTo: adminId)
        .get();

    if (query.docs.isNotEmpty) {
      return query.docs.first['phone'];
    }
    return null;
  }

  Future<void> _handleStudentEmailLogin() async {
    String email = emailController.text.trim();
    String password = passController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Fields cannot be empty"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      final userCredential =
      await AuthService().signInWithEmail(email, password);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Logged In Successfully!"),
        backgroundColor: Colors.orange,)
      );
      //Navigator.pushReplacement(
      //  context,
       // MaterialPageRoute(builder: (_) => StudentHomeScreen()),
     // );

    } on FirebaseAuthException catch (e) {
      String message = "Login failed";

      if (e.code == 'user-not-found') {
        message = "No user found with this email";
      } else if (e.code == 'wrong-password') {
        message = "Incorrect password";
      } else if (e.code == 'invalid-email') {
        message = "Invalid email format";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  Future<void> _handleAdminLogin() async {
    String adminId = adminidController.text.trim();

    String? phone = await getPhoneFromAdminId(adminId);

    if (phone == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid Admin ID")),
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
  Future<void> _handleStaffLogin() async {
    String empid = empidController.text.trim();

    String? phone = await getPhoneFromEmpId(empid);

    if (phone == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid Employee ID")),
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

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91$phone", // India
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);

       // Navigator.pushReplacement(
        //  context,
        //  MaterialPageRoute(builder: (_) => StudentHomeScreen()),
       // );
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? "Verification failed"),
            backgroundColor: Colors.red,
          ),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OtpScreen(verificationId: verificationId),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
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
               StudentEmailLoginForm(emailController: emailController, passController: passController, onLogin: _handleStudentEmailLogin,)
            else if(selectedRole == "Student" && selectedMethod == "Phone")
              StudentPhoneLoginForm(phoneController: phoneController, passController: passController, onVerifyPhone: _verifyPhoneNumber,)
            else if(selectedRole=='Staff')
              StaffLoginForm(nameController: nameController, empidController: empidController, onVerifyPhone: _handleStaffLogin,)
            else
              AdminLogin(adminidController: adminidController,onVerifyPhone: _handleAdminLogin,),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: const Text("Don't have an Account? SignUp"),
            )
          ],
        ),
      ),
    );
  }

}
