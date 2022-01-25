import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class OpAmp extends StatefulWidget {
  const OpAmp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OpAmpState createState() => _OpAmpState();
}

class _OpAmpState extends State<OpAmp> {

  TextEditingController _controllerInputResistor = TextEditingController();
  TextEditingController _controllerFeedbackResistor = TextEditingController();

  String _code = "";

  int _selectedIndex = 1;
  String _answerGain = '';

  List<String> opAmpImages = [
     'assets/inverting_opamp.png',
    'assets/non_inverting_opamp.png'
  ];

  List<String> opAmpStrings = [
    'Inverting Op-Amp Gain Calculator',
    'Non-Inverting Op-Amp Gain Calculator'
  ];

  List<String> opAmpSelectionStrings = [
    'Inverting Op-Amp',
    'Non-Inverting Op-Amp'
  ];

  @override
  void initState() {

    _controllerInputResistor.addListener(() {
      setState(() {
        _code = _controllerInputResistor.text;

      });
    });

    _controllerFeedbackResistor.addListener(() {
      setState(() {
        _code = _controllerFeedbackResistor.text;

      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _controllerInputResistor.dispose();
    _controllerFeedbackResistor.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white),),
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
                      Text(opAmpStrings[_selectedIndex], style: GoogleFonts.lato(fontSize: 25),),
                      SizedBox(height: 8,),
                      Container(
                        child: DropdownButton(
                          value: _selectedIndex,
                          items: [
                            DropdownMenuItem(
                              child: Text(opAmpSelectionStrings[0]),
                              value: 0,
                            ),
                            DropdownMenuItem(
                              child: Text(opAmpSelectionStrings[1]),
                              value: 1,
                            ),
                          ],
                          onChanged: (int value) {
                            setState(() {
                              _selectedIndex = value;
                            });
                          },
                          hint: Text('Select Mode'),
                        ),
                      ),
                      Image(
                        image: AssetImage(opAmpImages[_selectedIndex]),
                        width: MediaQuery.of(context).size.width,

                      ),
                      SizedBox(height: 15,),
                      buildCodeField(),
                      MaterialButton(
                        child: Text('Calculate Gain'),
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
                            double rin = double.parse(_controllerInputResistor.text);
                            double rf = double.parse(_controllerFeedbackResistor.text);

                            double gainInverting, gainNonInverting;

                            if(_selectedIndex == 0) {
                              gainInverting = rf / rin;
                              _answerGain = gainInverting.toStringAsFixed(4);
                            } else if(_selectedIndex == 1) {
                              gainNonInverting = 1 + (rf / rin);
                              _answerGain = gainNonInverting.toStringAsFixed(4);
                            }

                          });

                        },
                      ),
                      SizedBox(height: 8,),
                      Text('Gain 👇 ', style: GoogleFonts.lato(fontSize: 35, fontWeight: FontWeight.w600),),
                      SizedBox(height: 8,),
                      Text(_answerGain, style: GoogleFonts.lato(fontSize: 35, fontWeight: FontWeight.w600),),
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
          'Input Resistor (Rin) : Ohm',
          style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        // 4
        TextField(
          // 5
          controller: _controllerInputResistor,
          // 6
          cursorColor: Colors.deepOrange,
          // 7
          decoration: InputDecoration(
            // 8
            focusColor: Colors.deepOrange,
            hintText: 'Enter Rin value... (Ohm)',
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
          'Feedback Resistor (Rf)',
          style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        // 4
        TextField(
          // 5
          controller: _controllerFeedbackResistor,
          // 6
          cursorColor: Colors.deepOrange,
          // 7
          decoration: InputDecoration(
            // 8
            focusColor: Colors.deepOrange,
            hintText: 'Enter Rf value... (Ohm)',
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
      ],
    );
  }
}


