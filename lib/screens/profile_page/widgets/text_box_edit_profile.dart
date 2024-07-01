import "package:flutter/material.dart";

class text_box_edit_profile extends StatelessWidget {
  final String text;
  final String sectionName;
  final void Function()? onPressed;
  const text_box_edit_profile({
    super.key,
    required this.text,
    required this.sectionName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black)   
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
                Padding(
                  padding: const EdgeInsets.only(
                    left:10,
                    top:5
                  ),
                  child: Text(
                    sectionName,
                    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0),),
                  ),
                ),
                IconButton(
                  onPressed: onPressed, 
                  icon: const Icon(
                    Icons.settings,
                    color:Color.fromARGB(255, 119, 119, 119)),
                  )
              ],
            ),
            //text
            Container(
              height: 1,
              padding: const EdgeInsets.only(bottom: 10),  // Altura de la línea
              color: const Color.fromARGB(255, 255, 145, 0), // Color de la línea
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 5,bottom: 4),
              child: Text(text,style: const TextStyle(color: Color.fromARGB(255, 121, 120, 119)),),
            ),
          ],
        ),
    );
  }
}