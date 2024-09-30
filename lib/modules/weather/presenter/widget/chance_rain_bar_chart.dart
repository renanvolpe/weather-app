import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/modules/core/style/text_style.dart';
import 'package:weather_app/modules/core/utils/date_intl.dart';

import '../../../core/style/app_color.dart';
import '../../data/model/forecastday/forecastday_model.dart';
import '../state/bloc/get_forecast_7days/get_forecast7_days_bloc.dart';

class BarChartSample1 extends StatefulWidget {
  BarChartSample1({super.key});

  List<Color> get availableColors => const <Color>[
        AppColor.kPrimary,
        AppColor.kPrimaryLight,
        AppColor.kWhite,
        AppColor.grey1,
        AppColor.kgrey2,
        AppColor.kPrimaryLight,
      ];

  final Color barBackgroundColor = AppColor.kPrimary.withOpacity(0.1);
  final Color barColor = AppColor.kPrimary;
  final Color touchedBarColor = AppColor.kPrimaryLight;

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  late GetForecast7DaysBloc getForecast7DaysBloc;
  List<ForecastdayModel> listValues = [];
  @override
  void initState() {
    super.initState();
    getForecast7DaysBloc = Modular.get<GetForecast7DaysBloc>();
  }

  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetForecast7DaysBloc, GetForecast7DaysState>(
      bloc: Modular.get<GetForecast7DaysBloc>(),
      builder: (context, state) {
        if (state is GetForecast7DaysSuccess) {
          for (var e in state.list) {
            listValues.add(e);
          }
          return AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: [
                          const Gap(7),
                          Text("ºC", style: Style.defaultStyle.copyWith(fontSize: 14)),
                        ],
                      ),
                      const Gap(15),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: BarChart(
                            mainBarData(),
                          ),
                        ),
                      ),
                      const Gap(5),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          borderSide:
              isTouched ? BorderSide(color: widget.touchedBarColor) : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 45,
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(3, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, listValues[0].day.avgtemp_c, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, listValues[1].day.avgtemp_c, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, listValues[2].day.avgtemp_c, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (_) => Colors.blueGrey,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = 'Monday';
                break;
              case 1:
                weekDay = 'Tuesday';
                break;
              case 2:
                weekDay = 'Wednesday';
                break;
              case 3:
                weekDay = 'Thursday';
                break;
              case 4:
                weekDay = 'Friday';
                break;
              case 5:
                weekDay = 'Saturday';
                break;
              case 6:
                weekDay = 'Sunday';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: const TextStyle(
                    color: Colors.white, //widget.touchedBarColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions || barTouchResponse == null || barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (v, m) {
                return Text(listValues[v.toInt()].day.avgtemp_c.toString(),
                    style: Style.defaultStyle.copyWith(fontSize: 13));
              }),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (v, m) => getTitles(v, m, listValues),
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (v, m) {
                return Text(m.formattedValue, style: Style.defaultStyle.copyWith(fontSize: 13));
              }),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta, List<ForecastdayModel> listDays) {
    var style = Style.defaultStyle;
    Widget text;
    int i = value.toInt();
    switch (i) {
      case 0:
        text = Text('Today', style: style);
        break;
      case 1:
        text = Text(DateIntl.stringToDateForecast(listDays[i].date), style: style);
        break;
      case 2:
        text = Text(DateIntl.stringToDateForecast(listDays[i].date), style: style);
        break;

      default:
        text = Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}
