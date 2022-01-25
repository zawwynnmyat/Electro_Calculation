import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

class SMDResistor extends StatefulWidget {
  const SMDResistor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SMDResistorState createState() => _SMDResistorState();
}

class _SMDResistorState extends State<SMDResistor> {

  TextEditingController _controller = TextEditingController();

  String _code = "";
  String _resistanceString = "";

  @override
  void initState() {

    _controller.addListener(() {
      setState(() {
        _code = _controller.text;

      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
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
                      Text('SMD Resistor 3 OR 4 Digits', style: GoogleFonts.lato(fontSize: 25),),
                      Stack(
                          children: [
                            Image(
                              image: AssetImage('assets/smd_resistor.png'),
                              width: 300,
                              height: 200,
                            ),
                            Positioned(
                                top: 55,
                                left: 65,
                                child:  Text(
                                  _code,
                                  style: GoogleFonts.lato(color: Colors.white,fontSize: 60),
                                )
                            )

                          ]
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
                          String userEnteredCode = _controller.text;
                          if(userEnteredCode.contains("R")) {
                            setState(() {
                              int indexOfR = userEnteredCode.indexOf("R");
                              print(indexOfR);
                              _resistanceString = userEnteredCode.replaceAll("R", ".");

                              if(indexOfR != 0) {
                                _resistanceString = _resistanceString + " Ohm";
                              } else {
                                _resistanceString = "0" + _resistanceString + " Ohm";
                              }
                            });
                          } else {
                            setState(() {
                              int rCode = int.parse(userEnteredCode);
                              double firstCode = rCode / 10;

                              int fCode= firstCode.toInt();
                              int lastCode = rCode.remainder(10);

                              var resistance = fCode * (pow(10, lastCode));

                              if(resistance >= 1000000) {
                                _resistanceString = (resistance/1000000).toStringAsFixed(2) + ' M Ohm';
                              } else if (resistance >= 1000) {
                                _resistanceString = (resistance/1000).toStringAsFixed(2) + ' k Ohm';
                              } else {
                                _resistanceString = resistance.toStringAsFixed(2) + ' Ohm';
                              }

                            });

                          }
                        },

                      ),
                      SizedBox(height: 8,),
                      Text(_resistanceString, style: GoogleFonts.lato(fontSize: 35, fontWeight: FontWeight.w600),)
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
          'SMD Code',
          style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        // 4
        TextField(
          // 5
          controller: _controller,
          maxLength: 4,
          // 6
          cursorColor: Colors.deepOrange,
          // 7
          decoration: InputDecoration(
            // 8
            focusColor: Colors.deepOrange,
            hintText: 'Enter your Resistor SMD Code',
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
      ],
    );
  }
}


