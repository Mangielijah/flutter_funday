import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.child_care,
            color: Colors.blue[900],
            size: 38,
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            "Freelancer",
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontStyle: FontStyle.italic,
            ),
          )
        ],
      ),
    );
  }
}
