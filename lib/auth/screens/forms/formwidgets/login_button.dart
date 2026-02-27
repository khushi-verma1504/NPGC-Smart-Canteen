import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LoginEmailButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(onPressed: (){

      },
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: ElevatedButton(onPressed: (){

      },
          child: Text('Verify your phone number', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Color(0xffffffff)),),
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Colors.orange
        ),
      ),
    );
  }

}
