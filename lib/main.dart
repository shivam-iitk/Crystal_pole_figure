import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ugp_app/orient.dart';
import 'package:ugp_app/view.dart';
import 'package:ugp_app/lattice.dart';
import 'package:ugp_app/about.dart';

void main() {
  runApp(appScreen());
}

class appScreen extends StatefulWidget {
  @override
  State<appScreen> createState() => _appScreenState();
}

class _appScreenState extends State<appScreen> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0x000000)),
      home: ResponsiveSizer(builder: (context, orientation, screenType) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 36.h,
                  width: 400,
                  color: Colors.black87,
                ),
                Divider(
                  color: Colors.blue,
                  height: 0.1.h,
                  indent: 2.w,
                  endIndent: 2.w,
                ),
                Container(
                  height: 31.h,
                  width: 400,
                  color: Colors.black87,
                ),
                Divider(
                  color: Colors.blue,
                  height: 0.1.h,
                  indent: 2.w,
                  endIndent: 2.w,
                ),
                Container(
                  height: 25.h,
                  width: 400,
                  color: Colors.black87,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = 1;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 3.7.h,
                                child: Chip(
                                  shadowColor: Colors.black,
                                  backgroundColor: (selectedIndex == 1)
                                      ? Colors.blue
                                      : Colors.blue[800],
                                  label: const Text(
                                    'Orientation',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = 2;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 30,
                                child: Chip(
                                  backgroundColor: (selectedIndex == 2)
                                      ? Colors.blue
                                      : Colors.blue[800],
                                  label: const Text(
                                    'Lattice',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = 3;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 30,
                                child: Chip(
                                  backgroundColor: (selectedIndex == 3)
                                      ? Colors.blue
                                      : Colors.blue[800],
                                  label: const Text(
                                    'View',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = 4;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 30,
                                child: Chip(
                                  backgroundColor: (selectedIndex == 4)
                                      ? Colors.blue
                                      : Colors.blue[800],
                                  label: const Text(
                                    'About',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.blue,
                        height: 0.1.h,
                        indent: 2.w,
                        endIndent: 2.w,
                      ),
                      if (selectedIndex == 1)
                        orient()
                      else if (selectedIndex == 2)
                        lattice()
                      else if (selectedIndex == 3)
                        view()
                      else if (selectedIndex == 4)
                        about()
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
