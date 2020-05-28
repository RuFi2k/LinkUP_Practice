import 'package:FlutterApp/UI/components/header.dart';
import 'package:FlutterApp/data_layer/models/task.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as chart;

class StatisticPage extends StatefulWidget{
  final List<Task> chartData;
  final double amount;

  StatisticPage(this.chartData, this.amount, {Key key}) : super(key: key);

  _StatisticPage createState() => _StatisticPage();
}

class _StatisticPage extends State<StatisticPage>{
  @override
  void initState(){
    _seriesData = List<chart.Series<Task, String>>();
    _generateData(); //TODO: This is temporary method to check some data displaying on chart
  }

  List<chart.Series<Task, String>> _seriesData;

  _generateData(){
    List<Task> pieData = <Task>[
      new Task('Name', Color(0xFFF9A219), 30.0, icon: Icons.add),
      new Task('Name2', Color(0xFFFF8B92), 27.0, icon: Icons.add),
      new Task('Name3', Color(0xFFFF4889), 18.0, icon: Icons.add),
      new Task('Name4', Color(0xFF2ED6FE), 16.0, icon: Icons.add),
      new Task('Name5', Color(0xFFC491FB), 9.0, icon: Icons.add),
    ];

    _seriesData.add(
      chart.Series(
        data: pieData,
        domainFn: (Task task, _) => task.name,
        measureFn: (Task task,_) => task.percentage,
        colorFn: (Task task,_) => chart.ColorUtil.fromDartColor(task.color),
        id: 'Total expenses',
        labelAccessorFn: (Task task, _) => '${task.name}\n(${task.percentage})',
      ),
    );
  }

  String generateAmountString(){
    return '${widget.amount < 0 ? "-" : "+"}\$${widget.amount.abs().toInt()}';
  }

  @override
  Widget build(BuildContext context){
    return ListView(
      children: <Widget>[
        Header('Expenses Report'),
        Column(
          children: <Widget>[
            Padding(
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
                    Center(
                      child: Text(
                        '${generateAmountString()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Total Expenses',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFC7D6EA),
                        ),
                      ),
                    ),
                    Container(
                      height: 300,
                      child: chart.PieChart(
                        _seriesData,
                        animate: true,
                        animationDuration: Duration(seconds: 2),
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
                    ),
                  ],
                ),
              ),
            ),
            Padding(
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
                    //TODO: Line chart with average expenses by days here
                    Center(child: Text(
                      '850',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22
                      ),
                    )),
                    Center(child: Text(
                        'Avg Expenses',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFBECFE7),
                      ),
                    )),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}