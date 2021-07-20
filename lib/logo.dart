import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final Color textColor;
  const Logo({
    Key key,
    this.textColor: Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
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
                color: textColor,
                fontSize: 19,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
    );
  }
}
