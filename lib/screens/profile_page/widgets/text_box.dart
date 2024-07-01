import "package:flutter/material.dart";

class TextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final void Function()? onPressed;
  const TextBox({
    super.key,
    required this.text,
    required this.sectionName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 180, 180, 180),
          borderRadius: BorderRadius.circular(8)
        ),
        padding: const EdgeInsets.only(
          left:15,
          bottom: 15
        ),
        margin: const EdgeInsets.only(
          left:20,
          right: 20,
          top: 20
        ),
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            //section name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sectionName,
                  style: const TextStyle(color: Colors.grey),
                ),

                //edit button
                IconButton(
                  onPressed: onPressed, 
                  icon: const Icon(
                    Icons.settings,
                    color:Color.fromARGB(255, 119, 119, 119)),
                  )
              ],
            ),
            //text
            Text(text),
          ],
        ),
    );
  }
}