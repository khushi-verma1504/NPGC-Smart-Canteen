import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminIdField extends StatefulWidget{
  final TextEditingController adminidController;
  const AdminIdField({
    super.key,
    required this.adminidController
  });
  @override
  State<StatefulWidget> createState() => _AdminIdState();
}

class _AdminIdState extends State<AdminIdField>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Icon(
            Icons.lock_person,
            color: Colors.orange,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: widget.adminidController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Enter Admin ID",
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