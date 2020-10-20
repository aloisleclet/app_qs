import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//helpers
import 'package:app/helper/size_helper.dart';

//viewmodels
import 'package:app/viewmodel/focus_viewmodel.dart';

//views
import 'package:app/view/focus_view.dart';

//widgets
import 'package:app/widget/drawer_widget.dart';

class FocusView extends StatefulWidget {
  FocusView();
  
  @override
  _FocusViewState createState() => _FocusViewState();
}

class _FocusViewState extends State<FocusView> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FocusViewModel>(
      create: (context) => FocusViewModel(),
      child: Consumer<FocusViewModel>(
        builder: (context, model, child) =>
        Scaffold(
          drawer: DrawerCommon(),
          appBar: AppBar(
            title: Text('Focus'),
          ),
          body: AbsorbPointer(
            absorbing: model.inProgress,
            child: Swiper(
              itemBuilder: (BuildContext context,int index){
                return Center(
                  child: Container(
                    height: 100.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Text(model.activities[index]),
                        ),
                        Center(
                          child: Text(model.duration != '' ? model.duration : ''),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: model.activities.length,
              onIndexChanged: (index) {
                model.current = index; 
              }
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              model.inProgress = !model.inProgress;

              if (!model.inProgress)
                _showFeedbackDialog(model);

            },
            tooltip: model.inProgress ? 'stop' : 'start focusing',
            child: Icon(model.inProgress ? Icons.stop : Icons.play_arrow),
          ),
        )
      )
    );
  }

  _showFeedbackDialog(FocusViewModel model)
  {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Well done !"), //TODO randomize that
              content: TextField( //TODO possibility to select type of user input mode (textfield, jauge, checkbox ...)
                decoration: InputDecoration(
//                  border: OutlineInputBorder(),
                  labelText: 'Comments (optionnal)', //TODO possibility to custom question ex: quality sleep (0/5)
                ),
                onChanged: (value)
                {
                  model.feedback = value; 
                }
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Continue'),
                  onPressed: () {
                    model.saveActivity();
                    Navigator.of(context).pop();
                  },
                )
              ],
        )
    );
  }
}
