import 'package:flutter/material.dart';

class My_Card extends StatelessWidget {
  My_Card({@required this.child, this.color, this.text, this.onPress});
  final Color color;
  final IconData child;
  final String text;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              child,
              color: color,
              size: 80,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xFF122132),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
