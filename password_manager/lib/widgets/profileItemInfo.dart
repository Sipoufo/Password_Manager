import 'package:flutter/material.dart';
import 'package:password_manager/utils/colors.dart';

class ProfileItemInfo extends StatelessWidget {
  final IconData icon;
  final String info;
  final VoidCallback? onTap;
  const ProfileItemInfo({
    super.key,
    required this.icon,
    required this.info,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Primary,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              info,
            ),
          ],
        ),
      ),
    );
  }
}
