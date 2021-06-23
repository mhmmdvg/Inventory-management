import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:inventory_management/widget/indicator_widget_chart.dart';

class PieChartWidget extends StatefulWidget {
  @override
  _PieChartWidgetState createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  int _touchIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 4.2,
      child: Row(
        children: [
          Container(
            width: 160,
            height: size.height / 5,
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: PieChart(
              PieChartData(
                borderData: FlBorderData(
                  show: false,
                ),
                centerSpaceRadius: 40.0,
                sectionsSpace: 0,
                startDegreeOffset: 30,
                sections: showingSections(),
                pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                  setState(() {
                    if (pieTouchResponse.touchInput is FlLongPressEnd ||
                        pieTouchResponse.touchInput is FlPanEnd) {
                      _touchIndex = -1;
                    } else {
                      _touchIndex = pieTouchResponse.touchedSectionIndex;
                    }
                  });
                }),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IndicatorWidget(
                      color: Colors.indigo,
                      iconPath: 'assets/icons/in.svg',
                      title: 'Stock In',
                      subtitle: '671',
                    ),
                    IndicatorWidget(
                      color: Colors.cyan[300],
                      iconPath: 'assets/icons/out.svg',
                      title: 'Stock Out',
                      subtitle: '200',
                    ),
                    IndicatorWidget(
                      color: Colors.pink[100],
                      iconPath: 'assets/icons/icons8-box-2.svg',
                      title: 'Total',
                      subtitle: '1245',
                    ),
                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }
 
 List<PieChartSectionData> showingSections(){
   return List.generate(3, (i){
     final isTouched = i == _touchIndex;
     final double radius = isTouched ? 30 : 20;
     switch(i){
       case 0:
        return PieChartSectionData(
          color: Colors.pink[100],
          value: 80.12,
          title: '',
          radius: radius,
        );
        case 1:
        return PieChartSectionData(
          color: Color(0xff39439f),
          value: 50.52,
          title: '',
          radius: radius,
        );
        case 2:
        return PieChartSectionData(
          color: Color(0xff0eaeb4),
          value: 65.12,
          title: '',
          radius: radius,
        );
        default:
        return null;
     }
   });
 }
}
