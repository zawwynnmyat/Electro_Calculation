import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class LedSeries extends StatefulWidget {
  const LedSeries({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LedSeriesState createState() => _LedSeriesState();
}

class _LedSeriesState extends State<LedSeries> {


  String _code = "";
  String _answerResistance = "";
  String _answerWatt = "";

  TextEditingController _controllerSupplyVoltage = TextEditingController();
  TextEditingController _controllerForwardVoltage = TextEditingController();
  TextEditingController _controllerForwardCurrent = TextEditingController();

  @override
  void initState() {

    _controllerSupplyVoltage.addListener(() {
      setState(() {
        _code = _controllerSupplyVoltage.text;
      });
    });

    _controllerForwardVoltage.addListener(() {
      setState(() {
        _code = _controllerForwardVoltage.text;
      });
    });

    _controllerForwardCurrent.addListener(() {
      setState(() {
        _code = _controllerForwardCurrent.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllerForwardVoltage.dispose();
    _controllerForwardCurrent.dispose();
    _controllerSupplyVoltage.dispose();

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
                      Text('Battery Life', style: GoogleFonts.lato(fontSize: 25),),
                      SizedBox(height: 8,),
                      Image(
                        image: AssetImage('assets/led-series-diagram.jpg'),
                        width: 150,

                      ),
                      SizedBox(height: 8,),
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


                            if(_controllerForwardCurrent.text != null && _controllerForwardVoltage.text != null && _controllerSupplyVoltage.text != null) {
                              double vs = double.parse(_controllerSupplyVoltage.text);
                              double vf = double.parse(_controllerForwardVoltage.text);
                              double current_f = double.parse(_controllerForwardCurrent.text);
                              if(vf > vs) {
                                _answerResistance = "Warning: Forward Voltage > Supply Voltage";
                                _answerWatt = "";
                              } else if (vf == vs) {
                                _answerResistance = "Infinity";
                                _answerWatt = "Infinity";

                              } else {
                                _answerResistance = (((vs-vf) / current_f)*1000).toStringAsFixed(3) + ' Ohm';
                                _answerWatt = ((pow((vs - vf), 2)/((vs-vf) / current_f))/1000).toStringAsFixed(3) + ' W';
                              }
                            } else {
                              _answerWatt="";
                              _answerResistance = "Enter All Values!";
                            }


                          });

                        },
                      ),
                      SizedBox(height: 8,),
                      Text('Result 👇', style: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.deepOrange),),
                      SizedBox(height: 8,),
                      Text(_answerResistance, style: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.w600),),
                      Text(_answerWatt, style: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.w600),),
                      Text('', style: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.w600),),
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
          'Supply Voltage (V)',
          style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        // 4
        TextField(
          // 5
          controller: _controllerSupplyVoltage,
          // 6
          keyboardType: TextInputType.number,
          cursorColor: Colors.deepOrange,
          // 7
          decoration: InputDecoration(
            // 8

            focusColor: Colors.deepOrange,
            hintText: 'Enter Voltage...',
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
          'Forward Voltage (V)',
          style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        // 4
        TextField(
          // 5
          controller: _controllerForwardVoltage,
          // 6
          keyboardType: TextInputType.number,
          cursorColor: Colors.deepOrange,
          // 7
          decoration: InputDecoration(
            // 8
            focusColor: Colors.deepOrange,
            hintText: 'Enter Voltage...',
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
          'Forward Current (mA)',
          style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        // 4
        TextField(
          // 5
          controller: _controllerForwardCurrent,
          // 6
          keyboardType: TextInputType.number,
          cursorColor: Colors.deepOrange,
          // 7
          decoration: InputDecoration(
            // 8
            focusColor: Colors.deepOrange,
            hintText: 'Enter Current...',
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


