import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class ResistorThree extends StatefulWidget {
  const ResistorThree({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ResistorThreeState createState() => _ResistorThreeState();
}

class _ResistorThreeState extends State<ResistorThree> {

  int _fristBandSelected = 0;
  int _secondBandSelected = 0;
  int _multiplierSelected = 0;

  String _answerResistanceString = "";

  List<String> _digitColors = [
    'Black 0',
    'Brown 1',
    'Red 2',
    'Orange 3',
    'Yellow 4',
    'Green 5',
    'Blue 6',
    'Violet 7',
    'Grey 8',
    'White 9'
  ];

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
                      Text('Resistor 3 Bands Color Code', style: GoogleFonts.lato(fontSize: 25),),
                      SizedBox(height: 8,),
                      Image(
                        image: AssetImage('assets/resistors/resistor_three_band.png'),
                        width: 300,
                        height: 200,
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
                            int value = ((_fristBandSelected * 10) + (_secondBandSelected));
                            double multiplier = 0;

                            if(_multiplierSelected == 0) {
                              multiplier = 1;
                            } else if(_multiplierSelected == 1) {
                              multiplier = 10;
                            } else if(_multiplierSelected == 2) {
                              multiplier = 100;
                            } else if(_multiplierSelected == 3) {
                              multiplier = 1000;
                            } else if(_multiplierSelected == 4) {
                              multiplier = 10000;
                            } else if(_multiplierSelected == 5) {
                              multiplier = 100000;
                            } else if(_multiplierSelected == 6) {
                              multiplier = 1000000;
                            } else if(_multiplierSelected == 7) {
                              multiplier = 10000000;
                            } else if(_multiplierSelected == 8) {
                              multiplier = 100000000;
                            } else if(_multiplierSelected == 9) {
                              multiplier = 1000000000;
                            } else if(_multiplierSelected == 10) {
                              multiplier = 0.1;
                            } else if(_multiplierSelected == 11) {
                              multiplier = 0.01;
                            }


                            double resistance = value * multiplier;

                            if (resistance >= 1000000000) {
                              int quotient =  (resistance / 1000000000).toInt();
                              int remainder = resistance.toInt() % 1000000000;
                              _answerResistanceString = quotient.toString()+'.'+remainder.toString()+ " G Ohm";

                            } else if (resistance >= 1000000) {
                              int quotient =  (resistance / 1000000).toInt();
                              int remainder = resistance.toInt() % 1000000;
                              _answerResistanceString = quotient.toString()+'.'+remainder.toString()+ " M Ohm";

                            } else if(resistance >= 1000) {
                              int quotient =  (resistance / 1000).toInt();
                              int remainder = resistance.toInt() % 1000;
                              _answerResistanceString = quotient.toString()+'.'+ remainder.toString()+" k Ohm";
                            }  else {
                              _answerResistanceString = resistance.toStringAsFixed(2)+" Ohm";
                            }

                            //_answerResistanceString = resistance.toStringAsFixed(2) + ' Ohm';
                            // print(resistance);

                          });
                        },
                      ),
                      SizedBox(height: 8,),
                      Text(_answerResistanceString, style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w600),),
                      //Text(_answerToleranceString, style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w600),),
                      // Text('_calculatedCapacitanceM', style: GoogleFonts.lato(fontSize: 35, fontWeight: FontWeight.w600),),
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
      children: [
        Text('1st Band of Color', textAlign: TextAlign.start, style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold
        ),),
        Container(
          child: DropdownButton(
            underline: DropdownButtonHideUnderline(child: Container()),
            isExpanded: true,
            value: _fristBandSelected,

            items: [
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[0], style: TextStyle(color: Colors.white),),
                ),
                value: 0,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[1], style: TextStyle(color: Colors.white),),
                ),
                value: 1,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[2], style: TextStyle(color: Colors.white),),
                ),
                value: 2,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[3], style: TextStyle(color: Colors.white),),
                ),
                value: 3,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[4], style: TextStyle(color: Colors.black),),
                ),
                value: 4,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[5], style: TextStyle(color: Colors.white),),
                ),
                value: 5,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[6], style: TextStyle(color: Colors.white),),
                ),
                value: 6,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[7], style: TextStyle(color: Colors.white),),
                ),
                value: 7,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[8], style: TextStyle(color: Colors.white),),
                ),
                value: 8,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[9], style: TextStyle(color: Colors.black),),
                ),
                value: 9,
              ),
            ],
            onChanged: (int value) {
              setState(() {
                _fristBandSelected = value;

              });
            },
            hint: Text('Select Mode'),
          ),
        ),
        SizedBox(height: 10,),
        Text('2nd Band of Color', textAlign: TextAlign.start, style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold
        ),),
        Container(
          child: DropdownButton(
            underline: DropdownButtonHideUnderline(child: Container()),
            isExpanded: true,
            value: _secondBandSelected,

            items: [
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[0], style: TextStyle(color: Colors.white),),
                ),
                value: 0,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[1], style: TextStyle(color: Colors.white),),
                ),
                value: 1,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[2], style: TextStyle(color: Colors.white),),
                ),
                value: 2,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[3], style: TextStyle(color: Colors.white),),
                ),
                value: 3,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[4], style: TextStyle(color: Colors.black),),
                ),
                value: 4,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[5], style: TextStyle(color: Colors.white),),
                ),
                value: 5,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[6], style: TextStyle(color: Colors.white),),
                ),
                value: 6,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[7], style: TextStyle(color: Colors.white),),
                ),
                value: 7,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[8], style: TextStyle(color: Colors.white),),
                ),
                value: 8,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_digitColors[9], style: TextStyle(color: Colors.black),),
                ),
                value: 9,
              ),
            ],
            onChanged: (int value) {
              setState(() {
                _secondBandSelected = value;

              });
            },
            hint: Text('Select Mode'),
          ),
        ),
        SizedBox(height: 10,),
        Text('Multiplier', textAlign: TextAlign.start, style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold
        ),),
        Container(
          child: DropdownButton(
            underline: DropdownButtonHideUnderline(child: Container()),
            isExpanded: true,
            value: _multiplierSelected,

            items: [
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Black x1 Ohm', style: TextStyle(color: Colors.white),),
                ),
                value: 0,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Brown x10 Ohm', style: TextStyle(color: Colors.white),),
                ),
                value: 1,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Red x100 Ohm', style: TextStyle(color: Colors.white),),
                ),
                value: 2,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Orange x1 k Ohm', style: TextStyle(color: Colors.white),),
                ),
                value: 3,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Yellow x10 kOhm', style: TextStyle(color: Colors.black),),
                ),
                value: 4,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Green x100 kOhm', style: TextStyle(color: Colors.white),),
                ),
                value: 5,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Blue x1 MOhm', style: TextStyle(color: Colors.white),),
                ),
                value: 6,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Violet x10 MOhm', style: TextStyle(color: Colors.white),),
                ),
                value: 7,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Grey x100 MOhm', style: TextStyle(color: Colors.white),),
                ),
                value: 8,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('White x1 GOhm', style: TextStyle(color: Colors.black),),
                ),
                value: 9,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Gold x0.1 Ohm', style: TextStyle(color: Colors.black),),
                ),
                value: 10,
              ),
              DropdownMenuItem(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 12,bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Silver x0.01 Ohm', style: TextStyle(color: Colors.white),),
                ),
                value: 11,
              ),
            ],
            onChanged: (int value) {
              setState(() {
                _multiplierSelected = value;

              });
            },
            hint: Text('Select Mode'),
          ),
        ),
        SizedBox(height: 8,),
      ],
    );
  }
}


