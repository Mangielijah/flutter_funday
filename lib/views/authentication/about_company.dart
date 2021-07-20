import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_funday_1/utils/authentication.dart';
import 'package:flutter_funday_1/views/dashboard/dashboard.dart';
import 'package:flutter_funday_1/widgets/button.dart';

class AboutCompany extends StatelessWidget {
  final ValueNotifier<Map<String, dynamic>> cscNotifier = ValueNotifier({});
  TextEditingController bizNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final boxSize = ((size.width / 3) >= 400.0) ? 400 : (size / 3);
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          width: boxSize,
          height: 600,
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Center(
                  child: Text(
                    "Enter Information About Your Company",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                maxLines: 1,
                controller: bizNameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Company Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'Location',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              ValueListenableBuilder(
                valueListenable: cscNotifier,
                builder: (context, cscMap, _) {
                  print(cscMap);
                  return CSCPicker(
                    defaultCountry: DefaultCountry.Cameroon,
                    onCountryChanged: (value) {
                      cscNotifier.value = {
                        "country": value ?? DefaultCountry.Cameroon,
                        "state": cscNotifier.value['state'],
                        "city": cscNotifier.value['city']
                      };
                    },
                    onStateChanged: (value) {
                      cscNotifier.value = {
                        "country": cscNotifier.value['country'],
                        "state": value,
                        "city": cscNotifier.value['city']
                      };
                    },
                    onCityChanged: (value) {
                      // setState(() {
                      //   cityValue = value;
                      // });
                      cscNotifier.value = {
                        "country": cscNotifier.value['country'],
                        "state": cscNotifier.value['state'],
                        "city": value,
                      };
                    },
                  );
                },
              ),
              SizedBox(
                height: 18,
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Company Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Button(
                text: "Create Account",
                bgColor: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                onTap: () async {
                  if (bizNameController.text.isNotEmpty) {
                    firestore.collection("users").doc(uid).set({
                      'business_name': bizNameController.text, // John Doe
                      "country": cscNotifier.value['country'],
                      "state": cscNotifier.value['state'],
                      "city": cscNotifier.value['city'],
                    }).then((value) {
                      print("User Added");
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    }).catchError(
                        (error) => print("Failed to add user: $error"));
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
