import 'package:flutter/material.dart';

class Task{
  String name;
  IconData icon;
  Color color;
  double percentage;

  Task(this.name, this.color, this.percentage, {this.icon});
}