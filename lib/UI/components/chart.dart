import 'package:FlutterApp/data_layer/models/task.dart';
import 'package:charts_flutter/flutter.dart' as chart;
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  List<chart.Series<Task, String>> _seriesData;
  Chart(this._seriesData);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: chart.PieChart(
        _seriesData,
        animate: true,
        animationDuration: Duration(milliseconds: 500),
        behaviors: [
          chart.DatumLegend(
            outsideJustification: chart.OutsideJustification.middleDrawArea,
            horizontalFirst: false,
            desiredMaxRows: 3,
          ),
        ],
        defaultRenderer: chart.ArcRendererConfig(
          arcWidth: 60,
          arcRendererDecorators: [
            chart.ArcLabelDecorator(
              outsideLabelStyleSpec: chart.TextStyleSpec(
                fontSize: 18,
              ),
              labelPosition: chart.ArcLabelPosition.inside,
            ),
          ],
        ),
      ),
    );
  }
}
