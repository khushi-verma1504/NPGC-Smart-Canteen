import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class RoleSelector extends StatelessWidget{
  final String selectedRole;
  final ValueChanged<String> onRoleSelected;
  const RoleSelector({
    super.key,
    required this.selectedRole,
    required this.onRoleSelected,
  });

  Widget buildRoleCard( BuildContext context,
      String role,
      String assetPath,) {
    bool isSelected = selectedRole == role;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        height: 95,
        width: 120,
        decoration: BoxDecoration(
          border: Border.all(
            width: 4,
            color: isSelected ? Colors.orange : const Color(0xffADB3BC),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => onRoleSelected(role),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                assetPath,
                height: 40,
                width: 40,
                colorFilter: ColorFilter.mode(
                  isSelected ? Colors.orange : const Color(0xffADB3BC),
                  BlendMode.srcIn,
                ),
              ),
              Text(
                role,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildRoleCard(context, 'Student', 'assets/icons/Student.svg'),
        buildRoleCard(context, 'Staff','assets/icons/staff.svg'),
        buildRoleCard(context, 'Admin','assets/icons/admin.svg'),
      ],
    );
  }
}