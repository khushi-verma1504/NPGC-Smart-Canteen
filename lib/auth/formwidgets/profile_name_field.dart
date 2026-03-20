import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileName extends StatefulWidget{
  final TextEditingController nameController;
  const ProfileName({
    super.key,
    required this.nameController
  });
  @override
  State<ProfileName> createState() => _ProfileNameState();
}

class _ProfileNameState extends State<ProfileName> {
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
              controller: widget.nameController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Enter your FullName",
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