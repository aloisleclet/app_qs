import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 


class MenuViewModel extends ChangeNotifier
{
  int _achievementDone;

  MenuViewModel()
  {
    this._achievementDone = 0;
    notifyListeners();
  }

  get achievementDone => this._achievementDone; 
}
