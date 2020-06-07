import 'package:FlutterApp/data_layer/enums/transaction_categories.dart';
import 'package:FlutterApp/data_layer/models/task.dart';
import 'package:charts_flutter/flutter.dart' as chart;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatisticBody extends StatefulWidget {
  StatisticBody({Key key}) : super(key: key);

  _StatisticBody createState() => _StatisticBody();
}

class _StatisticBody extends State<StatisticBody> {
  List<chart.Series<Task, String>> _seriesData;
  double total = 0;
  double avg;

  @override
  void initState() {
    _seriesData = List<chart.Series<Task, String>>();
    //_generateData(); //TODO: This is temporary method to check some data displaying on chart
  }

  _generateData() {
    Map categoryObjects = Map();
    for (var doc in Provider.of<QuerySnapshot>(context).documents) {
      if (categoryObjects.containsKey(doc.data['category'])) {
        categoryObjects[doc.data['category']] +=
            doc.data['amount'].toDouble().abs();
      } else {
        categoryObjects.addAll(
            {doc.data['category']: doc.data['amount'].toDouble().abs()});
      }
    }
    List<Task> pieData = <Task>[];

    categoryObjects.forEach((key, value) {
      total += value;
    });

    avg = total / categoryObjects.length;

    categoryObjects.forEach((key, value) {
      pieData.add(Task(key, CategoryEnumExtensions.getCategoryColor(key),
          value / total * 100));
    });

    _seriesData.add(
      chart.Series(
        data: pieData,
        domainFn: (Task task, _) => task.name,
        measureFn: (Task task, _) => task.percentage,
        colorFn: (Task task, _) => chart.ColorUtil.fromDartColor(task.color),
        id: 'Total expenses',
        labelAccessorFn: (Task task, _) => '${task.name}\n(${task.percentage})',
      ),
    );
  }

  String generateAmountString() {
    return '${total < 0 ? "-" : "+"}\$${total.abs().toInt()}';
  }

  @override
  Widget build(BuildContext context) {
    _generateData();
    return Column(
      children: <Widget>[
        _buildChartSection(),
        _buildAvgSection(),
      ],
    );
  }

  Widget _buildChartSection() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              color: Color(0x88000000),
            )
          ],
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            _buildTotalAmount(),
            _buildTotalExpensesTitle(),
            _buildChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalAmount() {
    return Center(
      child: Text(
        '${generateAmountString()}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
      ),
    );
  }

  Widget _buildTotalExpensesTitle() {
    return Center(
      child: Text(
        'Total Expenses',
        style: TextStyle(
          fontSize: 20,
          color: Color(0xFFC7D6EA),
        ),
      ),
    );
  }

  Widget _buildChart() {
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

  Widget _buildAvgSection() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              color: Color(0x88000000),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildAvgAmount(),
            _buildAvgTitle(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvgAmount() {
    return Center(
      child: Text(
        avg.toString(),
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
    );
  }

  Widget _buildAvgTitle() {
    return Center(
      child: Text(
        'Avg Expenses',
        style: TextStyle(
          fontSize: 16,
          color: Color(0xFFBECFE7),
        ),
      ),
    );
  }
}
