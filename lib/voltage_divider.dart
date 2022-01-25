import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class VoltageDivider extends StatefulWidget {
  const VoltageDivider({Key key}) : super(key: key);

  @override
  _VoltageDividerState createState() => _VoltageDividerState();
}

class _VoltageDividerState extends State<VoltageDivider> {

  TextEditingController _controllerV1 = TextEditingController();
  TextEditingController _controllerR1 = TextEditingController();
  TextEditingController _controllerR2 = TextEditingController();

  String _code = "";

  String _answerVout = "";

  @override
  void initState() {

    _controllerV1.addListener(() {
      setState(() {
        _code = _controllerV1.text;

      });
    });

    _controllerV1.addListener(() {
      setState(() {
        _code = _controllerR1.text;

      });
    });

    _controllerV1.addListener(() {
      setState(() {
        _code = _controllerR2.text;

      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _controllerV1.dispose();
    _controllerR1.dispose();
    _controllerR2.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voltage Divider Calculator', style: TextStyle(color: Colors.white),),
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
                      Text('Voltage Divider Calculator', style: GoogleFonts.lato(fontSize: 25),),
                      SizedBox(height: 8,),
                      Image(
                        image: AssetImage('assets/voltage_divider.png'),
                        width: 150,

                      ),
                      buildCodeField(),
                      MaterialButton(
                        child: Text('Calculate Vout'),
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
                            double v1 = double.parse(_controllerV1.text);
                            double r1 = double.parse(_controllerR1.text);
                            double r2 = double.parse(_controllerR2.text);

                            double vout = (v1 * r2) / (r1 + r2);
                            _answerVout = vout.toStringAsFixed(3) + ' V';


                          });

                        },
                      ),
                      SizedBox(height: 8,),
                      Text('Output Voltage 👇', style: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.w600),),
                      SizedBox(height: 8,),
                      Text(_answerVout, style: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.w600),),
                      Text(' ', style: GoogleFonts.lato(fontSize: 35, fontWeight: FontWeight.w600),),
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
          'Voltage Input (V1)',
          style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        // 4
        TextField(
          // 5
          controller: _controllerV1,
          // 6
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
          '1st Resistance (R1)',
          style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        // 4
        TextField(
          // 5
          controller: _controllerR1,
          // 6
          cursorColor: Colors.deepOrange,
          // 7
          decoration: InputDecoration(
            // 8
            focusColor: Colors.deepOrange,
            hintText: 'Enter Resistance...',
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
          '2nd Resistance (R2)',
          style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        // 4
        TextField(
          // 5
          controller: _controllerR2,
          // 6
          cursorColor: Colors.deepOrange,
          // 7
          decoration: InputDecoration(
            // 8
            focusColor: Colors.deepOrange,
            hintText: 'Enter Resistance...',
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


