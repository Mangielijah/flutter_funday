import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PieView(),
    );
  }
}

class PieView extends StatelessWidget {
  const PieView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            //Piew Image
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                "https://www.smalltownwoman.com/wp-content/uploads/2015/06/Strawberry-Pancakes-DSC_0570-II.jpg",
                fit: BoxFit.fitWidth,
              ),
            ),
            //Spacing
            SizedBox(
              height: 16,
            ),
            //Description starts here
            Container(
              child: Column(
                children: [
                  //Title
                  Text(
                    "Strawbery Pancakes by Mangi",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //Spacing
                  SizedBox(
                    height: 8,
                  ),
                  //short description
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "This is a strawbery pancake it cost a small amount of money, do not read this text because it makes no sense",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  //Review
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StarIcons(),
                      //Spacing
                      SizedBox(
                        width: 12,
                      ),
                      Text("170 Reviews"),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StarIcons extends StatelessWidget {
  const StarIcons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
        ),
        Icon(
          Icons.star,
        ),
        Icon(
          Icons.star,
        ),
        Icon(
          Icons.star,
        ),
        Icon(
          Icons.star,
        ),
      ],
    );
  }
}

class PrepTime extends StatelessWidget {
  const PrepTime({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.time_to_leave,
        ),
      ],
    );
  }
}
