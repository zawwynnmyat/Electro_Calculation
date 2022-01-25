import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class FiveMonostable extends StatefulWidget {
  const FiveMonostable({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FiveMonostableState createState() => _FiveMonostableState();
}

class _FiveMonostableState extends State<FiveMonostable> {

  TextEditingController _controllerR1 = TextEditingController();
  TextEditingController _controllerC1 = TextEditingController();

  String _code = "";

  String _answerSecond = "";
  String _answerMiliSecond = "";

  var _ohmUnitItems = ["k Ohm", "Ohm"];
  var _cUnitItems = ["uF", "nF"];

  int _ohmUnitIndexValue = 1;
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


    super.initState();
  }

  @override
  void dispose() {
    _controllerR1.dispose();
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
                      Text('555 Monostable', style: GoogleFonts.lato(fontSize: 25),),
                      SizedBox(height: 8,),
                      Image(
                        image: AssetImage('assets/monostable.png'),
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
                            if(_ohmUnitIndexValue == 1 && _cUnitIndexValue == 1) {
                              _answerMiliSecond = (1.1 * double.parse(_controllerR1.text) * double.parse(_controllerC1.text)).toStringAsFixed(4);
                              _answerSecond = (double.parse(_answerMiliSecond) / 1000).toStringAsFixed(4);
                            } else if(_ohmUnitIndexValue == 2 && _cUnitIndexValue == 1) {
                              _answerMiliSecond = (1.1 * (double.parse(_controllerR1.text) / 1000) * double.parse(_controllerC1.text)).toStringAsFixed(4);
                              _answerSecond = (double.parse(_answerMiliSecond) / 1000).toStringAsFixed(4);
                            } else if(_ohmUnitIndexValue == 1 && _cUnitIndexValue == 2) {
                              _answerMiliSecond = (1.1 * double.parse(_controllerR1.text) * (double.parse(_controllerC1.text)/1000)).toStringAsFixed(4);
                              _answerSecond = (double.parse(_answerMiliSecond) / 1000).toStringAsFixed(4);
                            } else if(_ohmUnitIndexValue == 2 && _cUnitIndexValue == 2) {
                              _answerMiliSecond = (1.1 * (double.parse(_controllerR1.text)/1000) * (double.parse(_controllerC1.text)/1000)).toStringAsFixed(4);
                              _answerSecond = (double.parse(_answerMiliSecond) / 1000).toStringAsFixed(4);
                            }
                          });
                        },
                      ),
                      SizedBox(height: 8,),
                      Text(_answerMiliSecond + ' ms', style: GoogleFonts.lato(fontSize: 35, fontWeight: FontWeight.w600),),
                      Text(_answerSecond + ' s', style: GoogleFonts.lato(fontSize: 35, fontWeight: FontWeight.w600),),
                      Text('', style: GoogleFonts.lato(fontSize: 35, fontWeight: FontWeight.w600),),
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
              value: _ohmUnitIndexValue,
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
                  _ohmUnitIndexValue = value;
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



