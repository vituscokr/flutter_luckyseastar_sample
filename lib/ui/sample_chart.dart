import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SampleChart extends StatefulWidget {
  const SampleChart({Key? key}) : super(key: key);

  @override
  State<SampleChart> createState() => _SampleChartState();
}

class _SampleChartState extends State<SampleChart> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text("SampleChart")),
      body:
      LineChart(
        LineChartData(
          lineTouchData: LineTouchData(enabled: false),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            drawHorizontalLine: true,
          ),
          titlesData: FlTitlesData(
            bottomTitles:  AxisTitles(sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                String text = '';
                switch(value.toInt()) {
                  case 0:
                    text = "Jan";
                    break;
                  case 1:
                    text = "Feb";
                    break;
                  case 2:
                    text = "Mar";
                    break;
                  case 3:
                    text = "Apr";
                    break;
                  case 4:
                    text = "May";
                    break;
                  case 5:
                    text = "Jun";
                    break;
                  case 6:
                    text = "Jul";
                    break;
                  case 7:
                    text = "Aug";
                    break;
                  case 8:
                    text = "Sep";
                    break;
                  case 9:
                    text = "Oct";
                    break;
                  case 10:
                    text = "Nov";
                    break;
                  case 11:
                    text = "Dec";
                    break;
                  default:
                    text = "";
                    break;
                }
                return Text(text,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ));
              }
            )),
            leftTitles: AxisTitles(sideTitles:
            SideTitles(showTitles: true))

            // SideTitles(
            //   showTitles: true,
            //   getTextStyles: (context, value) => const TextStyle(
            //     color: Colors.black,
            //     fontWeight: FontWeight.bold,
            //     fontSize: 12,
            //   ),
            //   getTitles: (value) {
            //     return '\$${value.toInt()}k';
            //   },
            //   margin: 12,
            //   reservedSize: 40,
            // ),
          ),
          borderData: FlBorderData(
            show: true,
            border: const Border(
              bottom: BorderSide(color: Colors.black, width: 1),
              left: BorderSide(color: Colors.black, width: 1),
            ),
          ),
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 6,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 3),
                FlSpot(2.6, 2),
                FlSpot(4.9, 5),
                FlSpot(6.8, 2.5),
                FlSpot(8, 4),
                FlSpot(9.5, 3),
                FlSpot(11, 4),
              ],
              isCurved: true,
              color: Colors.blue,
              barWidth: 4,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      )


      // LineChart(
      //   swapAnimationDuration: Duration(microseconds: 15),
      //   swapAnimationCurve: Curves.linear,
      //   LineChartData(
      //
      //   ),
      // )
    );
  }
}


