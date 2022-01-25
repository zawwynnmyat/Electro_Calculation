import 'package:electro_calculation/resistor_paralle.dart';
import 'package:electro_calculation/resistor_series.dart';
import 'package:electro_calculation/voltage_divider.dart';
import 'package:flutter/material.dart';

class PageThreeListView extends StatefulWidget {

  PageThreeListView({Key key}) : super(key: key);

  @override
  _PageThreeListViewState createState() {
    return _PageThreeListViewState();
  }

}
class _PageThreeListViewState extends State<PageThreeListView> {

  List<String> images = [
     'others/voltage_divider_calc.png',
    'others/resistor_series.png',
    'others/resistor_parallel.png',
  ];

  List<String> titles = [
    'Voltage Divider Calculator',
    'Resistor Series Calculator',
    'Resistor Parallel Calculator'
  ];


  Widget build(BuildContext context) {

    return Container(
          child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: titles.length,
              itemBuilder: (context, int index) {

                return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                         builder: (context) {
                            if(index==0) {
                              return VoltageDivider();
                            } else if (index == 1){
                              return ResistorSeries();
                            } else {
                              return ResistorParallel();
                            }
                         }
                      ));
                    },
                    child: Card(
                      elevation: 20.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              constraints: const BoxConstraints.expand(
                                  width: 350,
                                  height: 200
                              ),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(images[index]),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0)
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                                titles[index],
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    )
                );
              }
          ),
        );
  }
}
