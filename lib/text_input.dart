import 'package:flutter/material.dart';

enum TextType {
  text,
  textarea,
}

class TextInputWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextType textType;
  final String hint;
  const TextInputWidget({
    Key key,
    @required this.title,
    this.subtitle,
    @required this.hint,
    @required this.textType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          if (this.subtitle != null)
            SizedBox(
              height: 12,
            ),
          if (this.subtitle != null) Text(this.subtitle),
          SizedBox(
            height: 12,
          ),
          if (this.textType == TextType.text)
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: this.hint,
              ),
              maxLines: 1,
            ),
          if (this.textType == TextType.textarea)
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: this.hint,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                hintMaxLines: 1,
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              maxLength: 4000,
            ),
          SizedBox(
            height: 36,
          ),
        ],
      ),
    );
  }
}
