import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//helpers
import 'package:app/helper/size_helper.dart';

//viewmodels
import 'package:app/viewmodel/menu_viewmodel.dart';

//views
import 'package:app/view/focus_view.dart';
import 'package:app/view/statistics_view.dart';

//widgets
import 'package:app/widget/drawer_widget.dart';

class MenuView extends StatefulWidget {
  MenuView();
  
  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MenuViewModel>(
      create: (context) => MenuViewModel(),
      child: Consumer<MenuViewModel>(
        builder: (context, model, child) =>
        Scaffold(
          drawer: DrawerCommon(),
          appBar: AppBar(
            title: Text('menu'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        child: Container(
                          width: getWidth(context) / 2, 
                          height: getHeight(context) / 2,
                          child: Center( 
                            child: Text('Challenge'),
                          ),
                        ),
                        onTap: () {
                          print('click challenge');  
                        },     
                      ),
                      InkWell(
                        child: Container(
                          width: getWidth(context) / 2, 
                          height: getHeight(context) / 2, 
                          child: Center(
                            child: Text('Achievement '+model.achievementDone.toString()),
                          ),
                        ),
                        onTap: () {
                          print('click achievement');  
                        },     
                      ),
                    ]
                ),    
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        child: Container(
                            width: getWidth(context) / 2, 
                            height: getHeight(context) / 2, 
                            child: Center(
                                child: Text('Statistics'),
                            ),
                        ),
                        onTap: () {
                          print('click statistics');  
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => StatisticsView()),
                            );
                        },     
                      ),
                      InkWell(
                        child: Container(
                            width: getWidth(context) / 2, 
                            height: getHeight(context) / 2, 
                            child: Center(
                              child: Text('Focus'),
                            ),
                        ),
                        onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FocusView()),
                            );
                        },     
                      ),
                    ]
                ),    
              ],
            ),
          ),
          //floatingActionButton: FloatingActionButton(
          //  onPressed: () {
          //    model.value = model.value + 1; 
          //  },
          //  tooltip: 'Increment',
          //  child: Icon(Icons.add),
          //),
        )
      )
    );
  }
}
