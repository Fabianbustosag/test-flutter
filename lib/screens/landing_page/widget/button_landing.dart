import 'package:flutter/material.dart';

class ButtonLanding extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const ButtonLanding({
    super.key,
    required this.text,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(
                color: Colors.orange,
                width: 2,
              ),
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.all(20),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Text(
              text,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward,color: Colors.white),
          ],
        ),
      ),
    );
  }
}
