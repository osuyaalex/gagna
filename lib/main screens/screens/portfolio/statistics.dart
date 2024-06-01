import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class Statistics extends StatefulWidget {
  final List<ChartData> data;
  final TooltipBehavior tooltip;
  Statistics({Key? key, required this.data, required this.tooltip,}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {


  @override
  Widget build(BuildContext context) {
    return  SfCartesianChart(
            primaryXAxis: CategoryAxis(
                majorGridLines: MajorGridLines(width: 0), // Removes major grid lines

            ),
            primaryYAxis: NumericAxis(
              minimum: 0,
              maximum: 40,
              interval: 10,
              opposedPosition: true,
              majorGridLines: MajorGridLines(width: 0), // Removes major grid lines
              minorGridLines: MinorGridLines(width: 0),
            ),
            tooltipBehavior: widget.tooltip,
            series: <CartesianSeries<ChartData, String>>[
              AreaSeries<ChartData, String>(
                  dataSource: widget.data,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  name: 'Gold',
                  color: Color(0xff005E5E))
            ]);
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}