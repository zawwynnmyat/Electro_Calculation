import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class CeramicCapacitor extends StatefulWidget {
  const CeramicCapacitor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CeramicCapacitorState createState() => _CeramicCapacitorState();
}

class _CeramicCapacitorState extends State<CeramicCapacitor> {

  TextEditingController _controller = TextEditingController();

  String _code = "";
  String _calculatedCapacitanceP = "";
  String _calculatedCapacitanceN = "";
  String _calculatedCapacitanceM = "";

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
                      Text('Ceramic Capacitor\'s 3digit', style: GoogleFonts.lato(fontSize: 25),),
                      SizedBox(height: 8,),
                      Image(
                        image: AssetImage('assets/ceramic.jpg'),
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
                            String userEnteredCode = _controller.text;
                            int remainder = (int.parse(userEnteredCode))%10;
                            double value = ((int.parse(userEnteredCode))/10).floorToDouble();

                            _calculatedCapacitanceP = (value*pow(10, remainder)).toString();
                            _calculatedCapacitanceP = _calculatedCapacitanceP + " pF";

                            _calculatedCapacitanceN = ((value*pow(10, remainder) * pow(10, -3))).toStringAsFixed(3);
                            _calculatedCapacitanceN = _calculatedCapacitanceN + " nF";

                            _calculatedCapacitanceM = ((value*pow(10, remainder) * pow(10, -6))).toStringAsFixed(6);
                            _calculatedCapacitanceM = _calculatedCapacitanceM + " uF";
                          });
                        },
                      ),
                      SizedBox(height: 8,),
                      Text(_calculatedCapacitanceP, style: GoogleFonts.lato(fontSize: 35, fontWeight: FontWeight.w600),),
                      Text(_calculatedCapacitanceN, style: GoogleFonts.lato(fontSize: 35, fontWeight: FontWeight.w600),),
                      Text(_calculatedCapacitanceM, style: GoogleFonts.lato(fontSize: 35, fontWeight: FontWeight.w600),),
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
          'Capacitor Code',
          style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        // 4
        TextField(
          // 5
          controller: _controller,
          keyboardType: TextInputType.number,
          maxLength: 3,
          // 6
          cursorColor: Colors.deepOrange,
          // 7
          decoration: InputDecoration(
            // 8
            focusColor: Colors.deepOrange,
            hintText: 'Enter 3 digit Capacitor Code',
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


