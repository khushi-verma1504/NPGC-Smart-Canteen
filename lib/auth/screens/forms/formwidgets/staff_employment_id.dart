import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaffEmpId extends StatefulWidget{
  final TextEditingController empidController;
  const StaffEmpId({
    super.key,
    required this.empidController
  });
  @override
  State<StatefulWidget> createState() => _StaffEmpIdState();
}

class _StaffEmpIdState extends State<StaffEmpId>{
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
              controller: widget.empidController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Enter Employment ID",
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