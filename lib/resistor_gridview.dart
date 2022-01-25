import 'package:electro_calculation/resistor_five.dart';
import 'package:electro_calculation/resistor_four.dart';
import 'package:electro_calculation/resistor_six.dart';
import 'package:electro_calculation/resistor_three.dart';
import 'package:electro_calculation/smd_resistor.dart';
import 'package:electro_calculation/smd_resistor_eia.dart';
import 'package:flutter/material.dart';


class ResistorGridView extends StatelessWidget {
  // This widget is the root of your application

  ResistorGridView({Key key}) : super(key: key);

  List<String> resistor_images = [
    'assets/resistors/smd_34.png',
    'assets/resistors/smd_eia96.png',
    'assets/resistors/resistor_three.png',
    'assets/resistors/resistor_four.png',
    'assets/resistors/resistor_five.png',
    'assets/resistors/resistor_six.png'
  ];

  List<String> calculation_names = [
    '3 OR 4 Digits Code',
    'SMD Resistor EIA-96',
    'Resistor 3 bands',
    'Resistor 4 bands',
    'Resistor 5 bands',
    'Resistor 6 bands',

  ];


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 16,right: 16),
        child: GridView.builder(
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
            ),
            itemBuilder: (context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        if(index==0) {
                          return SMDResistor(
                            title: "SMD Resistor Code",
                          );
                        } else if(index == 1) {
                          return SMDResistorEia(
                            title: 'Resistor EIA-96 Coding System',
                          );
                        }else if(index == 2) {
                          return ResistorThree(
                            title: 'Resistor 3 Bands',
                          );
                      } else if(index == 3) {
                          return ResistorFour(
                            title: 'Resistor 4 Bands'
                          );
                        } else if(index == 4) {
                          return ResistorFive(
                            title: 'Resistor 5 Bands',
                          );
                      } else if(index == 5) {
                         return ResistorSix(
                           title: 'Resistor 6 Bands',
                         );
                      }  else {
                          return Container();
                        }
                      }
                  ));
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          child: Image.asset(resistor_images[index],
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(calculation_names[index], style: Theme.of(context).textTheme.bodyText1, maxLines: 1,),
                     Text(" ", style: Theme.of(context).textTheme.bodyText1, maxLines: 1,)
                    ],
                  ),
                )
              );
            }
        )
    );
  }
}