import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProfileIcon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20)
              ),
              height: 70,
              width: 70,
              child: const Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              )
          ),
        ),
      ],
    );
  }

}