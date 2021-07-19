import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color bgColor;
  final String text;
  final Color textColor;
  final Function onTap;
  final EdgeInsets padding;
  final double fontSize;
  final FontWeight fontWeight;
  const Button({
    Key key,
    this.bgColor: Colors.blue,
    @required this.text,
    this.textColor: Colors.white,
    this.onTap,
    this.padding,
    this.fontSize: 16,
    this.fontWeight: FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap ?? () {},
        child: Container(
          // width: 150,
          // height: 58,
          color: bgColor,
          padding: padding ?? const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BorderButton extends StatelessWidget {
  final Color borderColor;
  final String text;
  final Color textColor;
  final Function onTap;
  final EdgeInsets padding;
  final double fontSize;
  final FontWeight fontWeight;
  final String image;
  const BorderButton({
    Key key,
    this.borderColor: Colors.blue,
    @required this.text,
    this.textColor: Colors.white,
    this.onTap,
    this.padding,
    this.fontSize,
    this.fontWeight: FontWeight.normal,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap ?? () {},
        child: Container(
          // width: 150,
          // height: 58,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
              width: 1,
            ),
          ),
          padding: padding ?? const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Center(
            child: image == null
                ? Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        text,
                        style: TextStyle(
                          color: textColor,
                          fontSize: fontSize,
                          fontWeight: fontWeight,
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
