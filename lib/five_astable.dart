import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class FiveAstable extends StatefulWidget {
  const FiveAstable({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FiveAstableState createState() => _FiveAstableState();
}

class _FiveAstableState extends State<FiveAstable> {

  TextEditingController _controllerR1 = TextEditingController();
  TextEditingController _controllerR2 = TextEditingController();
  TextEditingController _controllerC1 = TextEditingController();

  String _code = "";

  String _answerThSecond = "";
  String _answerThMiliSecond = "";

  String _answerTlSecond = "";
  String _answerTlMiliSecond = "";

  String _answerFrequencyH = "";
  String _answerFrequencyKHz = "";
  String _answerFrequencyMHz = "";

  var _ohmUnitItems = ["k Ohm", "Ohm"];

  var _cUnitItems = ["uF", "nF"];

  int _ohmUnitIndexValueR1 = 1;
  int _ohmUnitIndexValueR2 = 1;
  int _cUnitIndexValue = 1;

  @override
  void initState() {

    _controllerR1.addListener(() {
      setState(() {
        _code = _controllerR1.text;
      });
    });

    _controllerC1.addListener(() {
      setState(() {
        _code = _controllerC1.text;
      });
    });

    _controllerR2.addListener(() {
      setState(() {
        _code = _controllerR2.text;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _controllerR1.dispose();
    _controllerR2.dispose();
    _controllerC1.dispose();
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
                      Text('555 Astable', style: GoogleFonts.lato(fontSize: 25),),
                      SizedBox(height: 8,),
                      Image(
                        image: AssetImage('assets/astable.png'),
                        width: MediaQuery.of(context).size.width,

                      ),
                      buildCodeField(),
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
                            double r1, r2, c1;
                            double th, tl, f;

                            if(_ohmUnitIndexValueR1 == 2) {
                                r1 =  double.parse(_controllerR1.text) / 1000;
                            } else {
                              r1 = double.parse(_controllerR1.text);
                            }
                            if(_ohmUnitIndexValueR2 == 2) {
                              r2 =  double.parse(_controllerR2.text) / 1000;
                            } else {
                              r2 = double.parse(_controllerR2.text);

                            }
                            if(_cUnitIndexValue == 2) {
                              c1 =  double.parse(_controllerC1.text) / 1000;
                            } else {
                              c1 = double.parse(_controllerC1.text);
                            }

                            th = 0.693 * (r1+r2) * c1;
                            tl = 0.693 * r2 * c1;
                            f = 1.44 / ((r1 + 2 * r2) * c1);

                            _answerThMiliSecond = 'High Time , ' + th.toStringAsFixed(4) + ' ms';
                            _answerThSecond = ' = ' + (th/1000).toStringAsFixed(4) + ' s';

                            _answerTlMiliSecond = '\nLow Time , ' + tl.toStringAsFixed(4) + ' ms';
                            _answerTlSecond = ' = ' + (tl/1000).toStringAsFixed(4) + ' s';

                            _answerFrequencyH = '\nFrequency , ' + (f*1000).toStringAsFixed(4) + ' Hz';
                            _answerFrequencyKHz = ' = ' + f.toStringAsFixed(4) + ' kHz';
                          });
                        },
                      ),
                      SizedBox(height: 8,),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_answerThMiliSecond, style: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.w600),),
                              Text(_answerThSecond, style: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.w600),),
                              Text(_answerTlMiliSecond, style: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.w600),),
                              Text(_answerTlSecond, style: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.w600),),
                              Text(_answerFrequencyH, style: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.w600),),
                              Text(_answerFrequencyKHz, style: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.w600),),
                            ],
                          ),
                        ),
                      )

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
          'Resistor R1',
          style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        // 4
        DropdownButton(
          value: _ohmUnitIndexValueR1,
          items: [
            DropdownMenuItem(
              child: Text(_ohmUnitItems[0]),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text(_ohmUnitItems[1]),
              value: 2,
            ),
          ],
          onChanged: (int value) {
            setState(() {
              _ohmUnitIndexValueR1 = value;
            });
          },
          hint: Text('Select Unit'),
        ),

        TextField(
          // 5
          controller: _controllerR1,
          // 6
          cursorColor: Colors.deepOrange,
          keyboardType: TextInputType.number,
          // 7
          decoration: InputDecoration(
            // 8
            focusColor: Colors.deepOrange,
            hintText: 'Enter R1 value',
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
        SizedBox(height: 8,),
        Text(
          'Resistor R2',
          style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        // 4
        DropdownButton(
          value: _ohmUnitIndexValueR2,
          items: [
            DropdownMenuItem(
              child: Text(_ohmUnitItems[0]),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text(_ohmUnitItems[1]),
              value: 2,
            ),
          ],
          onChanged: (int value) {
            setState(() {
              _ohmUnitIndexValueR2 = value;
            });
          },
          hint: Text('Select Unit'),
        ),

        TextField(
          // 5
          controller: _controllerR2,
          // 6
          cursorColor: Colors.deepOrange,
          keyboardType: TextInputType.number,
          // 7
          decoration: InputDecoration(
            // 8
            focusColor: Colors.deepOrange,
            hintText: 'Enter R1 value',
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
        SizedBox(height: 8,),
        Text(
          'Capacitance  C1',
          style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        // 4

        DropdownButton(
          value: _cUnitIndexValue,
          items: [
            DropdownMenuItem(
              child: Text(_cUnitItems[0]),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text(_cUnitItems[1]),
              value: 2,
            ),
          ],
          onChanged: (int value) {
            setState(() {
              _cUnitIndexValue = value;
            });
          },
          hint: Text('Select Unit'),
        ),
        TextField(
          // 5
          controller: _controllerC1,
          keyboardType: TextInputType.number,
          // 6
          cursorColor: Colors.deepOrange,
          // 7
          decoration: InputDecoration(
            // 8
            focusColor: Colors.deepOrange,
            hintText: 'Enter C1 Value...',
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
        SizedBox(height: 8,),
      ],
    );
  }
}



