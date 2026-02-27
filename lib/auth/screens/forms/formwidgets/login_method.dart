import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginMethod extends StatelessWidget{
  final String selectedMethod;
  final Function(String) onMethodChanged;
  const LoginMethod({
    super.key,
    required this.selectedMethod,
    required this.onMethodChanged,
  });

  @override
  Widget buildLoginMethod(BuildContext context, String method, IconData icon){
    bool isSelected = selectedMethod == method;
    return InkWell(
      onTap: (){
        onMethodChanged(method);
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 40,
        width: 175,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isSelected ? Colors.orange : Color(0xffADB3BC),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(width: 2),
              Text(method, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Color(0xffffffff)))
            ],
        ),
        ),
    );
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildLoginMethod(context, 'Email', Icons.email),
        const SizedBox(width: 10),
        buildLoginMethod(context, 'Phone', Icons.email)
      ],
    );
  }
}