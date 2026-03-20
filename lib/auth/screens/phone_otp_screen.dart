import 'package:flutter/cupertino.dart';

class OtpScreen extends StatelessWidget{
  final String verificationId;
  const OtpScreen({
    super.key,
    required this.verificationId,
});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){}
        )
      ],
    );
  }

}