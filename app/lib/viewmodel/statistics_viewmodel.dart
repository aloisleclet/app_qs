import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 


class StatisticsViewModel extends ChangeNotifier
{
  int _achievementDone;

  StatisticsViewModel()
  {
    this._achievementDone = 0;
    notifyListeners();
  }

  get achievementDone => this._achievementDone; 
}
