import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 


class ActivitiesViewModel extends ChangeNotifier
{
  //int _achievementDone;

  List<Map> _activities = [];

  String _label = '';
  Color _color = Colors.black; 

  ActivitiesViewModel()
  {
    this._activities = [
      {'label': '#dev', 'color': Colors.red}, 
      {'label': '#sleep', 'color': Colors.red}, 
      {'label': '#trainning', 'color': Colors.red}, 
      {'label': '#repeat', 'color': Colors.red}, 
    ];

    notifyListeners();
  }

  set label(value)
  {
    this._label = value;
  }

  get activities => this._activities; 
}
