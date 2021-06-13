import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final String sideText;
  final Function onTap;
  const NextButton({
    Key key,
    @required this.sideText,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () => this.onTap(),
            child: Text("Next"),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            this.sideText,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          )
        ],
      ),
    );
  }
}
