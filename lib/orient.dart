import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

double value1 = 0;
double value2 = 0;
double value3 = 0;
int axis = 0;

class orient extends StatefulWidget {
  @override
  State<orient> createState() => _orientState();
}

class _orientState extends State<orient> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  @override
  void initState1() {
    super.initState();

    controller1.addListener(_setValue1);
  }

  void initState2() {
    super.initState();

    controller2.addListener(_setValue2);
  }

  void initState3() {
    super.initState();

    controller3.addListener(_setValue3);
  }

  _setValue1() {
    if (double.parse(controller1.text).roundToDouble() >= 0 &&
        double.parse(controller1.text).roundToDouble() <= 360) {
      setState(() {
        value1 = double.parse(controller1.text).roundToDouble();
      });
    }
    print("Second text field: ${controller1.text}");
  }

  _setValue2() {
    if (double.parse(controller2.text).roundToDouble() >= 0 &&
        double.parse(controller2.text).roundToDouble() <= 180) {
      setState(() {
        value2 = double.parse(controller2.text).roundToDouble();
      });
    }
    print("Second text field: ${controller2.text}");
  }

  _setValue3() {
    if (double.parse(controller3.text).roundToDouble() >= 0 &&
        double.parse(controller3.text).roundToDouble() <= 360) {
      setState(() {
        value3 = double.parse(controller3.text).roundToDouble();
      });
    }
    print("Second text field: ${controller3.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 2.4.h,
                  width: 77.w,
                  child: Slider.adaptive(
                      value: value1,
                      min: 0,
                      max: 360,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.blue[900],
                      onChanged: (value) {
                        setState(() {
                          value1 = value;
                          controller1.text = value.toStringAsFixed(1);
                        });
                      }),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  height: 4.3.h,
                  width: 11.3.w,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: value1.toStringAsFixed(1)),
                    onChanged: (value) {
                      _setValue1();
                    },
                    controller: controller1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 5.0),
                  child: Container(
                    height: 3.h,
                    width: 10.2.w,
                    child: const Text(
                      'ɸ₁',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Row(
              children: [
                Container(
                  height: 2.4.h,
                  width: 77.w,
                  child: Slider.adaptive(
                      value: value2,
                      min: 0.0,
                      max: 180.0,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.blue[900],
                      onChanged: (value) {
                        setState(() {
                          value2 = value;
                          controller2.text = value.toStringAsFixed(1);
                        });
                      }),
                ),
                Container(
                  height: 4.3.h,
                  width: 11.3.w,
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: value2.toStringAsFixed(1)),
                    onChanged: (value) {
                      _setValue2();
                    },
                    controller: controller2, // Only numbers can be entered
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 5.0),
                  child: Container(
                    height: 3.h,
                    width: 10.2.w,
                    child: const Text(
                      'φ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Row(
              children: [
                Container(
                  height: 2.4.h,
                  width: 77.w,
                  child: Slider.adaptive(
                      value: value3,
                      min: 0.0,
                      max: 360.0,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.blue[900],
                      onChanged: (value) {
                        setState(() {
                          value3 = value;
                          controller3.text = value.toStringAsFixed(1);
                        });
                      }),
                ),
                Container(
                  height: 4.3.h,
                  width: 11.3.w,
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: value3.toStringAsFixed(1)),
                    onChanged: (value) {
                      _setValue3();
                    },
                    controller: controller3, // Only numbers can be entered
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 5.0),
                  child: Container(
                    height: 3.h,
                    width: 10.2.w,
                    child: const Text(
                      'ɸ₂',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 2.4.h,
                  width: 20.5.w,
                  child: Text(
                    'Look along:',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      axis = 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      height: 3.7.h,
                      width: 10.2.w,
                      child: Chip(
                        shadowColor: Colors.black,
                        backgroundColor:
                            (axis == 1) ? Colors.blue : Colors.blue[800],
                        label: const Text(
                          'X',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      axis = 2;
                    });
                  },
                  child: Container(
                    height: 3.7.h,
                    width: 10.2.w,
                    child: Chip(
                      backgroundColor:
                          (axis == 2) ? Colors.blue : Colors.blue[800],
                      label: const Text(
                        'Y',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      axis = 3;
                    });
                  },
                  child: Container(
                    height: 3.7.h,
                    width: 10.2.w,
                    child: Container(
                      child: Chip(
                        backgroundColor:
                            (axis == 3) ? Colors.blue : Colors.blue[800],
                        label: const Text(
                          'Z',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      value1 = value2 = value3 = 0;
                      controller1.text = value1.toString();
                      controller2.text = value2.toString();
                      controller3.text = value3.toString();
                    });
                  },
                  child: Container(
                    height: 3.7.h,
                    child: const Chip(
                      backgroundColor: Colors.blue,
                      label: Text(
                        'Reset Angles',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}