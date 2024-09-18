import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/modules/core/style/app_color.dart';

import '../../../core/style/text_style.dart';

class DayForecastLineChart extends StatefulWidget {
  const DayForecastLineChart({super.key});

  @override
  State<DayForecastLineChart> createState() => _DayForecastLineChartState();
}

class _DayForecastLineChartState extends State<DayForecastLineChart> {
  List<Color> gradientColors = [
    AppColor.kBlack,
    AppColor.kPrimary,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(mainData()),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = Style.defaultStyle.copyWith(fontSize: 13);
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('Mon', style: style);
        break;
      case 1:
        text = Text('Tue', style: style);
        break;
      case 2:
        text = Text('Wen', style: style);
        break;
      case 3:
        text = Text('Thu', style: style);
        break;
      case 5:
        text = Text('Fri', style: style);
        break;
      case 6:
        text = Text('Sat', style: style);
        break;
      default:
        text = Text('Sun', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    var style = Style.primaryStyle.copyWith(fontSize: 14);
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0 ºC';
        break;
      case 10:
        text = '10 ºC';
        break;
      case 20:
        text = '20 ºC';
        break;
      case 30:
        text = '30 ºC';
        break;
      case 40:
        text = '40 ºC';
        break;
      case 50:
        text = '50 ºC';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 10,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColor.grey2,
            strokeWidth: 0.5,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColor.grey2,
            strokeWidth: 0.5,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 50,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 22),
            FlSpot(1, 32),
            FlSpot(2, 22),
            FlSpot(3, 45),
            FlSpot(4, 31),
            FlSpot(5, 14),
            FlSpot(6, 20),
          ],
          isCurved: true,
          curveSmoothness: 0.25,
          aboveBarData: BarAreaData(show: false),
          color: AppColor.kPrimary,
          barWidth: 2.5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: AppColor.kPrimary.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}
