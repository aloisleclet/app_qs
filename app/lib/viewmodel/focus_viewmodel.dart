import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'dart:async';

//helpers
import 'package:app/helper/time_helper.dart';
import 'package:app/helper/database_helper.dart';

//models
import 'package:app/model/activity_model.dart';

class FocusViewModel extends ChangeNotifier
{
  List<String> _activities = [];
  int _current = 0;
  bool _inProgress = false;
  bool _stopTimer = false; 
  String _duration = '';
  String _feedback = '';

  int _startTimestamp;
  int _endTimestamp;

  FocusViewModel()
  {
    this._current = 0;
    this._inProgress = false;
    this._duration = '00:00:00';
    this._activities = [
      '#dev',
      '#eat',
      '#sleep',
      '#dance_training',
      '#phyiscal_training',
      '#running',
      '#social',
    ];
    notifyListeners();
  }

  set inProgress(bool value)
  {

    if (value)
    {
      this._duration = '00:00:00';
      this._startTimestamp = DateTime.now().millisecondsSinceEpoch;

      Timer.periodic(new Duration(seconds: 1), (timer)
      {
        this._duration = format(Duration(seconds: timer.tick));
        
        if (this._stopTimer == true)
        {
          this._endTimestamp = DateTime.now().millisecondsSinceEpoch; 
         
          //stop timer and clear display & reset values
          timer.cancel();
          this._duration = '';
          this._stopTimer = false;
        }
        
        notifyListeners();
      });
    }
    else
    {
      //trigger stop chrono
      this._stopTimer = true;

      notifyListeners();
    }

    this._inProgress = value;
    notifyListeners();
  }

  saveActivity()
  {
    //save Activity
    print(this._current);
    print(this._feedback);
    print(this._startTimestamp.toString());
    print(this._endTimestamp.toString());
    Activity activity = Activity.fromMap
    ({
      'id': null,
      'id_activity_type': this._current, //will break when order activities by usage
      'feedback': this._feedback,
      'start_at': this._startTimestamp,
      'end_at': this._endTimestamp,
    });
    
    DatabaseHelper.instance.insertActivity(activity);

  
    DatabaseHelper.instance.getAllActivities().then((res) {
      print(res); 
    });

    //reset feedback field 
    this._feedback = '';
  }

  // currentIndex of swiper
  set current(int value)
  {
    this._current = value != null ? value : 0;
  }

  set feedback(dynamic value)
  {
    this._feedback = value; 
  }

  get activities => this._activities;
  get inProgress => this._inProgress;
  get duration => this._duration;
}
