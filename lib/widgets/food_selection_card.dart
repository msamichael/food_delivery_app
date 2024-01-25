import 'package:flutter/material.dart';



class FoodSelectionCard extends StatelessWidget {

  final VoidCallback onSelect;
  final Color color;
  final String imagePath;
  final String imageText;

  const FoodSelectionCard({
    super.key,
    required this.onSelect,
    required this.color,
    required this.imagePath,
    required this.imageText


    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onSelect,
          child: Container(
            height: 70,
            width: 70,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(2, 2), blurRadius: 5.0)],
          
            ),
            child: Image.asset(imagePath, fit: BoxFit.fill),
          
          
            
          ),
        ),
        SizedBox(height: 10,),
        Text(imageText,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),)
      ],
    );
  }
}

