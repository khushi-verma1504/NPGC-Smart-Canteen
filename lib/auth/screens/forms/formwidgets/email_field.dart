import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailField extends StatefulWidget{
  final TextEditingController emailController;
  const EmailField({
    super.key,
    required this.emailController
  });
  @override
  State<StatefulWidget> createState() => _EmailFieldState();
}
class _EmailFieldState extends State<EmailField>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Icon(
            Icons.person,
            color: Colors.orange,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: widget.emailController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Enter your email",
                hintStyle: TextStyle(
                  color: Color(0xffB3BFCB),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}