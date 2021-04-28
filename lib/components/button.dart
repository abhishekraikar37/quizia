import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyButton extends StatelessWidget {
  MyButton({@required this.color, this.ontap, this.option});
  final Color color;
  final Function ontap;
  final String option;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0x73e0a6b5),
              width: 4,
            ),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  option,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 22,
                    fontFamily: 'Jost',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Icon(
                FontAwesomeIcons.solidCheckCircle,
                size: 22,
                color: color,
              )
            ],
          )),
    );
  }
}
