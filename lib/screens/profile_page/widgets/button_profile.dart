import 'package:flutter/material.dart';

class button_profile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final IconData? icon;
  const button_profile({
    super.key,
    required this.text,
    required this.onTap,
    required this.icon, 
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFFF7A00)) 
        ),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(left: 30,right: 30,bottom: 10),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Icon(
                icon,
                color: const Color(0xFFEE693E),
                size: 35,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(color:Color(0xFFEE693E)),
            ),
          ],
        ),
      ),
    );
  }
}
