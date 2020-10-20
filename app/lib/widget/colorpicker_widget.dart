import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 

class ColorPicker extends StatefulWidget {
  ColorPicker();
  
  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {

  const ColorPicker({});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ColorPickerViewModel>(
      create: (context) => ColorPickerViewModel(),
      child: Consumer<ColorPickerViewModel>(
      builder: (context, model, child) =>

        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top:16.0),
                child: Text('Color', style:TextStyle(color: Colors.grey)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[for(int i = 0; i < 6; i++)
                  GestureDetector(
                    child: Container(
                      width: model.size,
                      height: model.size,
                      margin: EdgeInsets.only(right: 8.0, top: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black, width: model.selected == i ? 1 : 0),
                        color: model.colors[i],     
                      ), 
                    ),
                    onTap: () {
                      model.selected = i; 
                    }
                  ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[for(int i = 6; i < 12; i++)
                  GestureDetector(
                    child: Container(
                      width: model.size,
                      height: model.size,
                      margin: EdgeInsets.only(right: 8.0, top: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black, width: model.selected == i ? 1 : 0),
                        color: model.colors[i],     
                      ), 
                    ),
                    onTap: () {
                      model.selected = i; 
                    }
                  ),
                ],
              ),
            ]
        );
      ),
    ),
  }
}

class ColorPickerViewModel extends ChangeNotifier
{
  double _size = 26.0;
  int _selected = 0;

  List<Color> _colors = [
    const Color(0xFFfc5c65),
    const Color(0xFFeb3b5a),
    const Color(0xFFfd9644),
    const Color(0xFFfed330),
    const Color(0xFF26de81),
    const Color(0xFF2bcbba),
    const Color(0xFF45aaf2),
    const Color(0xFF4b7bec),
    const Color(0xFFa55eea),
    const Color(0xFFd1d8e0),
    const Color(0xFF778ca3),
    const Color(0xFF4b6584),
    const Color(0xFF4b6584),
    const Color(0xFF4b6584),
  ];

  ColorPickerViewModel()
  {
    notifyListeners();
  }

  set selected(int value)
  {
    this._selected = value;
    notifyListeners();
  }

  get selected => this._selected;
  get colors => this._colors; 
  get size => this._size; 
}
