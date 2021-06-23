import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:inventory_management/widget/pie_chart.dart';

class DateWithPieChart extends StatelessWidget {
  const DateWithPieChart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 21),
                      blurRadius: 53,
                      color: Colors.black.withOpacity(0.03)),
                ]),
            child: Column(
              children: <Widget>[
                buildDate(),
                PieChartWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Row buildDate() {
    return Row(
      children: <Widget>[
        AutoSizeText(
          "Today",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        AutoSizeText(
          "Jan 7",
          style: TextStyle(
            color: Colors.black.withOpacity(0.40),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}