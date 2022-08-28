import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

String latticetype = "Cubic";
String component = "{001}<100> Cube";
bool show = false;

double hexc = 0.00;
double orthoc = 0.00;
double orthob = 0.00;
double monoc = 0.00;

double c = 1.00;
double b = 1.00;
double y = 90.00;

final List<String> items = [
  'Cubic',
  'Hexagonal',
  'Ortorhombic',
  'Monoclinic',
];
final List<String> comp = [
  '{001}<100> Cube',
  '{112}<111> Copper',
  '{123}<634> S',
  '{110}<112> Bs',
  '{110}<001> G',
  '{113}<332> D',
  '{013}<100> CubeRD',
  '{001}<310> CubeND',
  '{001}<310> BR',
  '{258}<121> U(transition)',
  '{124}<211> R',
  '{011}<122> P',
  '{013}<231> Q',
  '{001}<110> Rotated cube',
  '{525}<151> A1',
  '{323}<131> A2',
  '{110}<011> A3',
];
int index = 1;

class lattice extends StatefulWidget {
  @override
  State<lattice> createState() => _latticeState();
}

class _latticeState extends State<lattice> {
  int latticeIndex = 1;
  int compIndex = 1;

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
    if (double.parse(controller1.text).roundToDouble() >= 1.00 &&
        double.parse(controller1.text).roundToDouble() <= 5.00) {
      setState(() {
        c = double.parse(controller1.text).roundToDouble();
      });
    }
    print("Second text field: ${controller1.text}");
  }

  _setValue2() {
    if (double.parse(controller2.text).roundToDouble() >= 0.50 &&
        double.parse(controller2.text).roundToDouble() <= 5.00) {
      setState(() {
        b = double.parse(controller2.text).roundToDouble();
      });
    }
    print("Second text field: ${controller2.text}");
  }

  _setValue3() {
    if (double.parse(controller3.text).roundToDouble() >= 1.00 &&
        double.parse(controller3.text).roundToDouble() <= 179.00) {
      setState(() {
        y = double.parse(controller3.text).roundToDouble();
      });
    }
    print("Second text field: ${controller3.text}");
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.black;
      }
      return Colors.white;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: const [
                      Icon(
                        Icons.list,
                        size: 16,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          'Cubic',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: latticetype,
                  onChanged: (value) {
                    setState(() {
                      latticetype = value as String;
                      latticeIndex = items.indexOf(latticetype) + 1;
                    });
                  },
                  icon: const Icon(Icons.arrow_downward_rounded),
                  iconSize: 14,
                  iconEnabledColor: Colors.white,
                  iconDisabledColor: Colors.grey,
                  buttonHeight: 30,
                  buttonWidth: 160,
                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.blue,
                  ),
                  buttonElevation: 2,
                  itemHeight: 30,
                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                  dropdownMaxHeight: 200,
                  dropdownWidth: 160,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.blue[800],
                  ),
                  dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 6,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(-20, 0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 8.0),
                child: Container(
                  height: 25,
                  width: 100,
                  child: const Text(
                    'Lattice Type',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          if (latticeIndex == 1)
            Column(
              children: [
                Container(
                  height: 50,
                  width: 350,
                  alignment: Alignment.topLeft,
                  child: Theme(
                    data: ThemeData(unselectedWidgetColor: Colors.white),
                    child: CheckboxListTile(
                      title: const Text(
                        "Show Thompson\'s tetrahedron",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      secondary: Icon(Icons.arrow_drop_down),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                      value: show,
                      onChanged: (bool? value) {
                        setState(() {
                          show = value!;
                        });
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      height: 25,
                      width: 200,
                      child: const Text(
                        'Ideal texture components',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Icon(
                            Icons.list,
                            size: 16,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          SizedBox(
                            child: Text(
                              '{001}<100> Cube',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: comp
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: component,
                      onChanged: (value) {
                        setState(() {
                          component = value as String;
                          compIndex = comp.indexOf(component) + 1;
                        });
                      },
                      icon: const Icon(Icons.arrow_downward_rounded),
                      iconSize: 14,
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 30,
                      buttonWidth: 200,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.blue,
                      ),
                      buttonElevation: 2,
                      itemHeight: 30,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 220,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.blue[800],
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(-20, 0),
                    ),
                  ),
                ),
              ],
            )
          else
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Container(
                    height: 20,
                    width: 300,
                    child: Slider.adaptive(
                        value: c,
                        min: 1.00,
                        max: 5.00,
                        activeColor: Colors.blue,
                        inactiveColor: Colors.blue[900],
                        onChanged: (value) {
                          setState(() {
                            c = value;
                            controller1.text = value.toStringAsFixed(2);
                          });
                        }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[800],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    height: 35,
                    width: 35,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: c.toStringAsFixed(1)),
                      onChanged: (value) {
                        _setValue1();
                      },
                      controller: controller1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3, left: 5.0),
                    child: Container(
                      height: 25,
                      width: 25,
                      child: const Text(
                        'c/a',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          if (latticeIndex == 3)
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 20,
                    width: 300,
                    child: Slider.adaptive(
                        value: b,
                        min: 0.50,
                        max: 5.00,
                        activeColor: Colors.blue,
                        inactiveColor: Colors.blue[900],
                        onChanged: (value) {
                          setState(() {
                            b = value;
                            controller2.text = value.toStringAsFixed(2);
                          });
                        }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[800],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    height: 35,
                    width: 35,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: b.toStringAsFixed(1)),
                      onChanged: (value) {
                        _setValue2();
                      },
                      controller: controller2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5.0),
                    child: Container(
                      height: 25,
                      width: 25,
                      child: const Text(
                        'b/a',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          else if (latticeIndex == 4)
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 20,
                    width: 300,
                    child: Slider.adaptive(
                        value: y,
                        min: 1.00,
                        max: 179.00,
                        activeColor: Colors.blue,
                        inactiveColor: Colors.blue[900],
                        onChanged: (value) {
                          setState(() {
                            y = value;
                            controller3.text = value.toStringAsFixed(2);
                          });
                        }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[800],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    height: 35,
                    width: 53,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: y.toStringAsFixed(1)),
                      onChanged: (value) {
                        _setValue3();
                      },
                      controller: controller3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5.0),
                    child: Container(
                      height: 25,
                      width: 15,
                      child: const Text(
                        'Y',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
