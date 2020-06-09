import 'package:FlutterApp/UI/components/avg_section.dart';
import 'package:FlutterApp/UI/components/chart.dart';
import 'package:FlutterApp/UI/components/total_amount.dart';
import 'package:FlutterApp/UI/components/total_expenses_title.dart';
import 'package:FlutterApp/data_layer/enums/transaction_categories.dart';
import 'package:FlutterApp/data_layer/models/task.dart';
import 'package:FlutterApp/data_layer/models/transaction_record_model.dart';
import 'package:charts_flutter/flutter.dart' as chart;
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
  }

  _generateData() {
    total = 0;
    Map categoryObjects = Map();
    var transactions = Provider.of<List<TransactionRecordModel>>(context);
    for (var doc in transactions) {
      if (categoryObjects
          .containsKey(CategoryEnumExtensions.EnumToString(doc.category))) {
        categoryObjects[CategoryEnumExtensions.EnumToString(doc.category)] +=
            doc.amount.toDouble().abs();
      } else {
        categoryObjects.addAll({
          CategoryEnumExtensions.EnumToString(doc.category):
              doc.amount.toDouble().abs()
        });
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

    if (_seriesData.length > 1) {
      var tmp = _seriesData[_seriesData.length - 1];
      _seriesData.clear();
      _seriesData.add(tmp);
    }
  }

  @override
  Widget build(BuildContext context) {
    _generateData();
    return Column(
      children: <Widget>[
        _buildChartSection(),
        AvgSection(avg),
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
            TotalAmount(total),
            TotalExpensesTitle(),
            Chart(_seriesData),
          ],
        ),
      ),
    );
  }
}
