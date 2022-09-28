import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class about extends StatefulWidget {
  @override
  State<about> createState() => _aboutState();
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("License"),
    content: Text("This is an alert message."),
    actions: [
      CloseButton(),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showDevInfo(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Developers"),
    content: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: const Offset(0, -8),
              child: const Text(
                '•',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Expanded(
              child: Text(
                'Subodh Kumar Kasaudhan',
              ),
            ),
          ],
        ),
        Expanded(
          child: Text(
            'shivm.iitk@gmail.com',
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: const Offset(0, -8),
              child: const Text(
                '•',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Expanded(
              child: Text(
                'Prof. Shikhar Jha',
              ),
            ),
          ],
        ),
        Expanded(
          child: Text(
            'skjha@iiyk.ac.in',
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: const Offset(0, -8),
              child: const Text(
                '•',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Expanded(
              child: Text(
                'Manasij Yadava',
              ),
            ),
          ],
        ),
        Expanded(
          child: Text(
            'manasijy@gmail.com',
          ),
        ),
      ],
    ),
    actions: [
      CloseButton(),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20, bottom: 5.0),
          child: Container(
            height: 20,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: const Text(
              'Crystal Pole Figure v1.0',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                height: 20,
                width: 230,
                alignment: Alignment.topLeft,
                child: const Text(
                  '© 2022 D303. Licensed under',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'MIT license',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          showAlertDialog(context);
                        }),
                ]),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'See developer info',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      showDevInfo(context);
                    }),
            ]),
          ),
        )
      ],
    );
  }
}
