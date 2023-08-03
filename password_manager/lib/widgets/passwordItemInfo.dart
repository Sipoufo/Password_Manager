import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_manager/utils/colors.dart';

class PasswordItemInfo extends StatelessWidget {
  final IconData icon;
  final String info;
  final bool haveIcon;
  const PasswordItemInfo({
    super.key,
    required this.icon,
    required this.info,
    this.haveIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: NeutralDark,
                size: 30,
              ),
              Text(
                info,
              ),
            ],
          ),
          // Container(
          //   child: GestureDetector(
          //     onTap: () {
          //       Clipboard.setData(ClipboardData(text: info));
          //     },
          //     child: const Icon(
          //       Icons.copy,
          //       color: Primary,
          //       size: 24,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
