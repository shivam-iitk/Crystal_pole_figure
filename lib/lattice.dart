import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

String latticetype = "Cubic";
String component = "{001}<100> Cube";
bool show = false;

double hexc = 0.00;
double orthoc = 0.00;
double orthob = 0.00;
double monoc = 0.00;

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
                  child: Text(
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
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.green,
                      // mouseCursor: true,
                      // fillColor: true,
                      checkColor: Colors.blue,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: show,
                      onChanged: (bool? value) {
                        setState(() {
                          show = value!;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                      child: Container(
                        height: 25,
                        width: 200,
                        child: Text(
                          'Show Thompson\'s tetrahedron',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      height: 25,
                      width: 200,
                      child: Text(
                        'Ideal texture components',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Align(
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
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
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
                ),
              ],
            )
          else if (latticeIndex == 2)
            Column(
              children: [],
            )
          else if (latticeIndex == 3)
            Column(
              children: [],
            )
          else if (latticeIndex == 4)
            Column(
              children: [],
            )
        ],
      ),
    );
  }
}
