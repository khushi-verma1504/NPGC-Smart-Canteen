import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PhoneField extends StatefulWidget{
  final TextEditingController phoneController;
  const PhoneField({
    super.key,
    required this.phoneController
  });
  @override
  State<StatefulWidget> createState() => _PhoneFieldState();
}
class _PhoneFieldState extends State<PhoneField>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Icon(
            Icons.phone,
            color: Colors.orange,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: widget.phoneController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Enter your phone number",
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