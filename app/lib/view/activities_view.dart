import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//helpers
import 'package:app/helper/size_helper.dart';

//viewmodels
import 'package:app/viewmodel/activities_viewmodel.dart';

//widgets
import 'package:app/widget/drawer_widget.dart';
import 'package:app/widget/indicator_widget.dart';
import 'package:app/widget/colorpicker_widget.dart';

class ActivitiesView extends StatefulWidget {
  ActivitiesView();
  
  @override
  _ActivitiesViewState createState() => _ActivitiesViewState();
}

class _ActivitiesViewState extends State<ActivitiesView> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ActivitiesViewModel>(
      create: (context) => ActivitiesViewModel(),
      child: Consumer<ActivitiesViewModel>(
        builder: (context, model, child) =>
        Scaffold(
          drawer: DrawerCommon(),
          appBar: AppBar(
            title: Text('Activities'),
          ),
          body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: model.activities.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(model.activities[index]['label']),
                    ),
                    Container(
                        width:16.0,
                        height:16.0,
                        padding: EdgeInsets.all(16.0),
                        color: model.activities[index]['color'],
                    ),
                  ]
                ),
              );
            }
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _showAddDialog(model);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        )
      )
    );
  }

  _showAddDialog(ActivitiesViewModel model)
  {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Add a new activities type"),
              content: SizedBox(
                height: 162.0,
                child:Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
//                        border: OutlineInputBorder(),
                        labelText: 'Label',
                      ),
                      onChanged: (value)
                      {
                        model.label = value; 
                      }
                    ),
                    ColorPicker(), 
                  ],
                ),
              ), 
              actions: <Widget>[
                FlatButton(
                  child: Text('Add'),
                  onPressed: () {
                    //model.saveActivityType();
                    Navigator.of(context).pop();
                  },
                )
              ],
        )
    );
  }




}
