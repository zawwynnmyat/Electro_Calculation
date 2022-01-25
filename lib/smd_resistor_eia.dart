import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

class SMDResistorEia extends StatefulWidget {
  const SMDResistorEia({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SMDResistorEiaState createState() => _SMDResistorEiaState();
}

class _SMDResistorEiaState extends State<SMDResistorEia> {

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
                      Text('SMD EIA-96 Conding System', style: GoogleFonts.lato(fontSize: 25),),
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
                          setState(() {
                            String rCode = "";
                            int firstNumber;
                            double resistance;

                            String userEnteredCode = _controller.text;
                            if((userEnteredCode != null) && (userEnteredCode.length >0)) {
                              rCode = userEnteredCode.substring(0, userEnteredCode.length - 1);
                            }
                            if(rCode == "01") {
                              firstNumber = 100;
                            } else if(rCode == "02") {
                              firstNumber = 102;
                            } else if(rCode == "03") {
                              firstNumber = 105;
                            } else if(rCode == "04") {
                              firstNumber = 107;
                            } else if(rCode == "05") {
                              firstNumber = 110;
                            } else if(rCode == "06") {
                              firstNumber = 113;
                            } else if(rCode == "07") {
                              firstNumber = 115;
                            } else if(rCode == "08") {
                              firstNumber = 118;
                            } else if(rCode == "09") {
                              firstNumber = 121;
                            } else if(rCode == "10") {
                              firstNumber = 124;
                            } else if(rCode == "1") {
                              firstNumber = 127;
                            } else if(rCode == "12") {
                              firstNumber = 130;
                            } else if(rCode == "13") {
                              firstNumber = 133;
                            } else if(rCode == "14") {
                              firstNumber = 137;
                            } else if(rCode == "15") {
                              firstNumber = 140;
                            } else if(rCode == "16") {
                              firstNumber = 143;
                            } else if(rCode == "17") {
                              firstNumber = 147;
                            } else if(rCode == "18") {
                              firstNumber = 150;
                            } else if(rCode == "19") {
                              firstNumber = 154;
                            } else if(rCode == "20") {
                              firstNumber = 158;
                            } else if(rCode == "21") {
                              firstNumber = 162;
                            } else if(rCode == "22") {
                              firstNumber = 165;
                            } else if(rCode == "23") {
                              firstNumber = 169;
                            } else if(rCode == "24") {
                              firstNumber = 174;
                            } else if(rCode == "25") {
                              firstNumber = 178;
                            } else if(rCode == "26") {
                              firstNumber = 182;
                            } else if(rCode == "27") {
                              firstNumber = 187;
                            } else if(rCode == "28") {
                              firstNumber = 191;
                            } else if(rCode == "29") {
                              firstNumber = 196;
                            } else if(rCode == "30") {
                              firstNumber = 200;
                            } else if(rCode == "31") {
                              firstNumber = 205;
                            } else if(rCode == "32") {
                              firstNumber = 210;
                            } else if(rCode == "33") {
                              firstNumber = 215;
                            } else if(rCode == "34") {
                              firstNumber = 221;
                            } else if(rCode == "35") {
                              firstNumber = 226;
                            } else if(rCode == "36") {
                              firstNumber = 232;
                            } else if(rCode == "37") {
                              firstNumber = 237;
                            } else if(rCode == "38") {
                              firstNumber = 243;
                            } else if(rCode == "39") {
                              firstNumber = 249;
                            } else if(rCode == "40") {
                              firstNumber = 255;
                            } else if(rCode == "41") {
                              firstNumber = 261;
                            } else if(rCode == "42") {
                              firstNumber = 267;
                            } else if(rCode == "43") {
                              firstNumber = 274;
                            } else if(rCode == "44") {
                              firstNumber = 280;
                            } else if(rCode == "45") {
                              firstNumber = 287;
                            } else if(rCode == "46") {
                              firstNumber = 294;
                            } else if(rCode == "47") {
                              firstNumber = 301;
                            } else if(rCode == "48") {
                              firstNumber = 309;
                            } else if(rCode == "49") {
                              firstNumber = 316;
                            } else if(rCode == "50") {
                              firstNumber = 324;
                            } else if(rCode == "51") {
                              firstNumber = 332;
                            } else if(rCode == "52") {
                              firstNumber = 340;
                            } else if(rCode == "53") {
                              firstNumber = 348;
                            } else if(rCode == "54") {
                              firstNumber = 357;
                            } else if(rCode == "55") {
                              firstNumber = 365;
                            } else if(rCode == "56") {
                              firstNumber = 374;
                            } else if(rCode == "57") {
                              firstNumber = 383;
                            } else if(rCode == "58") {
                              firstNumber = 392;
                            } else if(rCode == "59") {
                              firstNumber = 402;
                            } else if(rCode == "60") {
                              firstNumber = 412;
                            } else if(rCode == "61") {
                              firstNumber = 422;
                            } else if(rCode == "62") {
                              firstNumber = 432;
                            } else if(rCode == "63") {
                              firstNumber = 442;
                            } else if(rCode == "64") {
                              firstNumber = 453;
                            } else if(rCode == "65") {
                              firstNumber = 464;
                            } else if(rCode == "66") {
                              firstNumber = 475;
                            } else if(rCode == "67") {
                              firstNumber = 487;
                            } else if(rCode == "68") {
                              firstNumber = 499;
                            } else if(rCode == "69") {
                              firstNumber = 511;
                            } else if(rCode == "70") {
                              firstNumber = 523;
                            } else if(rCode == "71") {
                              firstNumber = 536;
                            } else if(rCode == "72") {
                              firstNumber = 549;
                            } else if(rCode == "73") {
                              firstNumber = 562;
                            } else if(rCode == "74") {
                              firstNumber = 576;
                            } else if(rCode == "75") {
                              firstNumber = 590;
                            } else if(rCode == "76") {
                              firstNumber = 604;
                            } else if(rCode == "77") {
                              firstNumber = 619;
                            } else if(rCode == "78") {
                              firstNumber = 634;
                            } else if(rCode == "79") {
                              firstNumber = 649;
                            } else if(rCode == "80") {
                              firstNumber = 665;
                            } else if(rCode == "81") {
                              firstNumber = 681;
                            } else if(rCode == "82") {
                              firstNumber = 698;
                            } else if(rCode == "83") {
                              firstNumber = 715;
                            } else if(rCode == "84") {
                              firstNumber = 732;
                            } else if(rCode == "85") {
                              firstNumber = 750;
                            } else if(rCode == "86") {
                              firstNumber = 768;
                            } else if(rCode == "87") {
                              firstNumber = 787;
                            } else if(rCode == "88") {
                              firstNumber = 806;
                            } else if(rCode == "89") {
                              firstNumber = 825;
                            } else if(rCode == "90") {
                              firstNumber = 845;
                            } else if(rCode == "91") {
                              firstNumber = 866;
                            } else if(rCode == "92") {
                              firstNumber = 887;
                            } else if(rCode == "93") {
                              firstNumber = 909;
                            } else if(rCode == "94") {
                              firstNumber = 931;
                            } else if(rCode == "95") {
                              firstNumber = 953;
                            } else if(rCode == "96") {
                              firstNumber = 976;
                            }

                            print(firstNumber);
                            String lastCode = userEnteredCode[2];
                            if(lastCode == "Z") {
                               resistance = firstNumber * 0.001;
                            } else if (lastCode == 'Y' || lastCode == 'R') {
                              resistance = firstNumber * 0.01;
                            } else if (lastCode == 'X' || lastCode == 'S') {
                              resistance = firstNumber * 0.1;
                            } else if (lastCode == 'A') {
                              resistance = firstNumber * 1.0;
                            } else if (lastCode == 'B' || lastCode == 'H') {
                              resistance = firstNumber * 10.0;
                            }  else if (lastCode == 'C') {
                              resistance = firstNumber * 100.0;
                            }  else if (lastCode == 'D') {
                              resistance = firstNumber * 1000.0;
                            }  else if (lastCode == 'E') {
                              resistance = firstNumber * 10000.0;
                            }  else if (lastCode == 'F') {
                              resistance = firstNumber * 100000.0;
                            }

                            if (resistance >= 1000000000) {
                              int quotient =  (resistance / 1000000000).toInt();
                              int remainder = resistance.toInt() % 1000000000;
                              _resistanceString = quotient.toString()+'.'+remainder.toString()+ " G Ohm";

                            } else if (resistance >= 1000000) {
                              int quotient =  (resistance / 1000000).toInt();
                              int remainder = resistance.toInt() % 1000000;
                              _resistanceString = quotient.toString()+'.'+remainder.toString()+ " M Ohm";

                            } else if(resistance >= 1000) {
                              int quotient =  (resistance / 1000).toInt();
                              int remainder = resistance.toInt() % 1000;
                              _resistanceString = quotient.toString()+'.'+ remainder.toString()+" k Ohm";
                            }  else {
                              _resistanceString = resistance.toStringAsFixed(2)+" Ohm";
                            }


                          });
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
          'SMD EIA-96 Code',
          style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        // 4
        TextField(
          // 5
          controller: _controller,
          maxLength: 3,
          // 6
          cursorColor: Colors.deepOrange,
          // 7
          decoration: InputDecoration(
            // 8
            focusColor: Colors.deepOrange,
            hintText: 'Enter your Resistor SMD Code, EIA-96',
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


