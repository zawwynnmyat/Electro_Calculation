import 'package:electro_calculation/battery_life.dart';
import 'package:electro_calculation/five_astable.dart';
import 'package:electro_calculation/five_monostable.dart';
import 'package:electro_calculation/led_series.dart';
import 'package:electro_calculation/op_amp.dart';
import 'package:flutter/material.dart';
import 'ceramic_capacitor.dart';

class PageTwoGridView extends StatelessWidget {
  // This widget is the root of your application

  PageTwoGridView({Key key}) : super(key: key);

  List<String> images = [
    'others/ceramic_calc.png',
    'others/battery_life_calc.png',
    'others/five3_astable.png',
    'others/five3_monostable.png',
    'others/led_series.png',
    'others/op_amp_calc.png'
  ];

  List<String> calculation_names = [
    'Capacitor Code',
    'Battery Life',
    '555 Astable',
    '555 Monostable',
    'LED Series Resistor',
    'Op-amp Gain',

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
                          if(index == 0) {
                            return CeramicCapacitor(title: "Capacitor Code",);
                          }else if (index ==1 ){
                            return BatteryLife(
                              title: "Battery Life Calculator",
                            );
                          } else if(index == 2){
                            return FiveAstable(
                              title: '555 Astable',
                            );
                          } else if(index == 3) {
                            return FiveMonostable(
                              title: '555 Monostable',
                            );
                          } else if(index == 4) {
                            return LedSeries(
                              title: 'LED Series Resistor Calculation',
                            );
                          } else if(index == 5) {
                            return OpAmp(
                              title: 'Op-Amp Calculator',
                            );
                          }
                          else {
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
                            child: Image.asset(images[index],
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