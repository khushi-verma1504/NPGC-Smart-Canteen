import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npgc_smart_canteen/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginEmailButton extends StatelessWidget{
  final VoidCallback onPressed;

  const LoginEmailButton({
    super.key,
    required this.onPressed,
});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(onPressed: onPressed,
        child: Text('Login', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Color(0xffffffff)),),
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Colors.orange
        ),
      ),
    );
  }
}

class LoginPhoneButton extends StatelessWidget{
final VoidCallback onVerifyPhone;
const LoginPhoneButton({
  super.key,
  required this.onVerifyPhone,
});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: ElevatedButton(
        onPressed: onVerifyPhone,
        child: Text('Verify your phone number', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Color(0xffffffff)),),
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Colors.orange
        ),
      ),
    );
  }

}


class SignUpEmailButton extends StatelessWidget{
  final VoidCallback onPressed;
  const SignUpEmailButton({
    super.key,
    required this.onPressed,
});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(onPressed: onPressed,
        child: Text('SignUp', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Color(0xffffffff)),),
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Colors.orange
        ),
      ),
    );
  }
}


