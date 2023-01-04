import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/controller/home_controller.dart';
import 'package:weather_app/model/fiveDaysData.dart';

class MyChart extends GetView<HomeController>

{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 240,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries<FiveDaysData , String>>[
            SplineAreaSeries(
                dataSource: controller.fiveDaysData,
                xValueMapper: (FiveDaysData f , _) =>
                f.dateTime,
                yValueMapper: (FiveDaysData f , _) =>
                    f.temp
            )
          ],
        ),
      ),
    );
  }
}