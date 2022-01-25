import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class ResistorParallel extends StatefulWidget {
  const ResistorParallel({Key key}) : super(key: key);

  @override
  _ResistorParallelState createState() => _ResistorParallelState();
}

class _ResistorParallelState extends State<ResistorParallel> {

  TextEditingController _controllerR1 = TextEditingController();
  TextEditingController _controllerR2 = TextEditingController();
  TextEditingController _controllerR3 = TextEditingController();
  TextEditingController _controllerR4 = TextEditingController();
  TextEditingController _controllerR5 = TextEditingController();
  TextEditingController _controllerR6 = TextEditingController();

  String _code = "";

  int _selectedIndex = 0;
  int _decreaseNumber = 0;

  List<int> resistors = [2,3,4,5,6];
  bool r3Visibility = false;
  bool r4Visibility = false;
  bool r5Visibility = false;
  bool r6Visibility = false;

  String _answerR = "";

  @override
  void initState() {

    _controllerR1.addListener(() {
      setState(() {
        _code = _controllerR1.text;
      });
    });

    _controllerR2.addListener(() {
      setState(() {
        _code = _controllerR2.text;
      });
    });

    _controllerR3.addListener(() {
      setState(() {
        _code = _controllerR3.text;
      });
    });

    _controllerR4.addListener(() {
      setState(() {
        _code = _controllerR4.text;
      });
    });

    _controllerR5.addListener(() {
      setState(() {
        _code = _controllerR5.text;
      });
    });

    _controllerR6.addListener(() {
      setState(() {
        _code = _controllerR6.text;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _controllerR1.dispose();
    _controllerR2.dispose();
    _controllerR3.dispose();
    _controllerR4.dispose();
    _controllerR5.dispose();
    _controllerR6.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resistors in Parallel', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child:  Center(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Text('Resistors in Parallel', style: GoogleFonts.lato(fontSize: 25),),
                      SizedBox(height: 8,),
                      Image(
                        image: AssetImage('assets/resistors/resistor_parallel.png'),
                        width: MediaQuery.of(context).size.width,

                      ),
                      SizedBox(height: 10,),
                      Text('Select number of Resistors \n(MAX : 6)', style: GoogleFonts.lato(fontSize: 20),),
                      Container(
                        child: DropdownButton(
                          value: _selectedIndex,
                          items: [
                            DropdownMenuItem(
                              child: Text('${resistors[0]}'),
                              value: 0,
                            ),
                            DropdownMenuItem(
                              child: Text('${resistors[1]}'),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text('${resistors[2]}'),
                              value: 2,
                            ),
                            DropdownMenuItem(
                              child: Text('${resistors[3]}'),
                              value: 3,
                            ),
                            DropdownMenuItem(
                              child: Text('${resistors[4]}'),
                              value: 4,
                            ),
                          ],
                          onChanged: (int value) {
                            setState(() {
                              _selectedIndex = value;
                              if(_selectedIndex == 0) {
                                r4Visibility =false;
                                r5Visibility= false;
                                r6Visibility = false;
                                r3Visibility = false;
                                _controllerR6.text = "";
                                _controllerR5.text = "";
                                _controllerR4.text = "";
                                _controllerR3.text = "";
                              } else if(_selectedIndex == 1) {
                                r4Visibility =false;
                                r5Visibility= false;
                                r6Visibility = false;
                                r3Visibility = true;
                                _controllerR6.text = "";
                                _controllerR5.text = "";
                                _controllerR4.text = "";
                              } else if(_selectedIndex == 2) {
                                r3Visibility = true;
                                r5Visibility = false;
                                r6Visibility = false;
                                r4Visibility = true;
                                _controllerR5.text = "";
                                _controllerR6.text = "";
                              } else if(_selectedIndex == 3) {
                                r3Visibility=true;
                                r4Visibility=true;
                                r6Visibility = false;
                                r5Visibility = true;
                                _controllerR6.text = "";
                              } else if(_selectedIndex == 4) {
                                r3Visibility = true;
                                r4Visibility = true;
                                r5Visibility = true;
                                r6Visibility = true;
                              }
                            });
                          },
                          hint: Text('Select Mode'),
                        ),
                      ),
                      MaterialButton(
                        child: Text('Calculate Ohm Value'),
                        elevation: 2.0,
                        minWidth: MediaQuery.of(context).size.width-12,
                        height: 40,
                        color: Colors.deepOrange,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        onPressed: () {
                          setState(() {
                            double r1, r2, r3, r4, r5, r6, r;

                            if(_controllerR1.text=="") {
                              r1 = 1;
                            } else {
                              r1 = double.parse(_controllerR1.text);
                            }
                            if(_controllerR2.text=="") {
                              r2 = 1;
                            } else {
                              r2 = double.parse(_controllerR2.text);
                            }
                            if(_controllerR3.text=="") {
                              r3 = 1;
                            } else {
                              r3 = double.parse(_controllerR3.text);
                            }
                            if(_controllerR4.text=="") {
                              r4 = 1;
                            } else {
                              r4 = double.parse(_controllerR4.text);
                            }
                            if(_controllerR5.text=="") {
                              r5 = 1;
                            } else {
                              r5 = double.parse(_controllerR5.text);
                            }
                            if(_controllerR6.text=="") {
                              r6 = 1;
                            } else {
                              r6 = double.parse(_controllerR6.text);
                            }


                            if(_selectedIndex == 0) {
                              r = 1 / ((1/r1) + (1/r2));
                            } else if (_selectedIndex == 1) {
                              r = 1 / ((1/r1) + (1/r2) + (1/r3));
                            } else if (_selectedIndex == 2) {
                              r = 1 / ((1/r1) + (1/r2) + (1/r3) + (1/r4));
                            } else if (_selectedIndex == 3) {
                              r = 1/ ((1/r1) + (1/r2) + (1/r3) + (1/r4) + (1/r5)) ;
                            } else if (_selectedIndex == 4) {
                              r = 1 / ((1/r1) + (1/r2) + (1/r3) + (1/r4) + (1/r5) + (1/r6));
                            }

                            _answerR = r.toStringAsFixed(4) + ' Ohm';

                          });

                        },
                      ),
                      SizedBox(height: 8,),
                      Text(_answerR, style: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.w600),),
                      buildCodeField(),
                    ],
                  ),
                ],
              ),
            )
        ),

      ),
    );
  }

  Widget buildCodeField() {
    // 1
    return Column(
      // 2
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 3
        Text(
          'R1 (Ohm)',
          style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        // 4
        TextField(
          // 5
          controller: _controllerR1,
          // 6
          keyboardType: TextInputType.number,
          cursorColor: Colors.deepOrange,
          // 7
          decoration: InputDecoration(
            // 8
            focusColor: Colors.deepOrange,
            hintText: 'Enter R1 Value',
            // 9
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange),
            ),
          ),
        ),
        SizedBox(height: 15,),
        Text(
          'R2 (Ohm)',
          style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        // 4
        TextField(
          // 5
          controller: _controllerR2,
          // 6
          keyboardType: TextInputType.number,
          cursorColor: Colors.deepOrange,
          // 7
          decoration: InputDecoration(
            // 8
            focusColor: Colors.deepOrange,
            hintText: 'Enter R2 Value',
            // 9
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange),
            ),
          ),
        ),
        Visibility(
          child: Text(
            'R3 (Ohm)',
            style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
          ),
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: r3Visibility,
        ),
        Visibility(
          child: TextField(
            // 5
            controller: _controllerR3,
            // 6
            keyboardType: TextInputType.number,
            cursorColor: Colors.deepOrange,
            // 7
            decoration: InputDecoration(
              // 8
              focusColor: Colors.deepOrange,
              hintText: 'Enter R3 Value',
              // 9
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
            ),
          ),
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: r3Visibility,
        ),
        Visibility(
          child: Text(
            'R4 (Ohm)',
            style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
          ),
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: r4Visibility,
        ),
        Visibility(
          child: TextField(
            // 5
            controller: _controllerR4,
            // 6
            keyboardType: TextInputType.number,
            cursorColor: Colors.deepOrange,
            // 7
            decoration: InputDecoration(
              // 8
              focusColor: Colors.deepOrange,
              hintText: 'Enter R4 Value',
              // 9
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
            ),
          ),
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: r4Visibility,
        ),
        Visibility(
          child: Text(
            'R5 (Ohm)',
            style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
          ),
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: r5Visibility,
        ),
        Visibility(
          child: TextField(
            // 5
            controller: _controllerR5,
            // 6
            keyboardType: TextInputType.number,
            cursorColor: Colors.deepOrange,
            // 7
            decoration: InputDecoration(
              // 8
              focusColor: Colors.deepOrange,
              hintText: 'Enter R5 Value',
              // 9
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
            ),
          ),
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: r5Visibility,
        ),
        Visibility(
          child: Text(
            'R6 (Ohm)',
            style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
          ),
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: r6Visibility,
        ),
        Visibility(
          child: TextField(
            // 5
            controller: _controllerR6,
            // 6
            keyboardType: TextInputType.number,
            cursorColor: Colors.deepOrange,
            // 7
            decoration: InputDecoration(
              // 8
              focusColor: Colors.deepOrange,
              hintText: 'Enter R6 Value',
              // 9
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
              ),
            ),
          ),
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: r6Visibility,
        ),
      ],
    );
  }
}


