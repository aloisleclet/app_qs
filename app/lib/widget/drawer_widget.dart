import 'package:flutter/material.dart';

//views
import 'package:app/view/focus_view.dart';
import 'package:app/view/statistics_view.dart';
import 'package:app/view/activities_view.dart';


class DrawerCommon extends StatelessWidget
{
 
  @override
  Widget build(BuildContext context)
  {
    return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Self-studies',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.av_timer),
          title: Text('Measure'),
          onTap: () {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => FocusView()),
             );
          
          },
        ),
        ListTile(
          leading: Icon(Icons.insert_chart),
          title: Text('Statistics'),
          onTap: () {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => StatisticsView()),
             );
          },
        ),
        ListTile(
          leading: Icon(Icons.grade),
          title: Text('Achievement'),
          onTap: () {
            print('click achievement'); 
          },
        ),
        ListTile(
          leading: Icon(Icons.fitness_center),
          title: Text('Challenges'),
        ),
        ListTile(
          leading: Icon(Icons.free_breakfast),
          title: Text('Activities'),
          onTap: () {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => ActivitiesView()),
             );
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
      ],
    ),
  ); 

  
  }

}
