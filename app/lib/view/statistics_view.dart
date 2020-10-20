import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

//helpers
import 'package:app/helper/size_helper.dart';

//viewmodels
import 'package:app/viewmodel/statistics_viewmodel.dart';

//widgets
import 'package:app/widget/indicator_widget.dart';
import 'package:app/widget/drawer_widget.dart';


class StatisticsView extends StatefulWidget {
  StatisticsView();
  
  @override
  _StatisticsViewState createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {

  @override
  Widget build(BuildContext context) {
   
    //pie chart 
    double fontSize = 16.0;
    double radius = 60.0;

    //bar chart 
   
    double barWidth = 16.0; 

    return ChangeNotifierProvider<StatisticsViewModel>(
      create: (context) => StatisticsViewModel(),
      child: Consumer<StatisticsViewModel>(
        builder: (context, model, child) =>
        DefaultTabController(
          length: 4,
          child: Scaffold(
              drawer: DrawerCommon(),
              appBar: AppBar(
              title: Text('Statistics'),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(32.0),
                child: TabBar(
                  tabs: [
                    Tab(text: 'today'),
                    Tab(text: 'week'),
                    Tab(text: 'month'),
                    Tab(text: 'year'),
                  ],
                ), 
              ), 
            ),
            body: TabBarView(
               children: [
                  Center(
                  ///////////////////////////////////TAB TODAY
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              PieChart(
                                PieChartData(
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 40,
                                  sections: [
                                    PieChartSectionData(
                                      color: const Color(0xff0293ee),
                                      value: 10,
                                      title: '#dev',
                                      radius: radius,
                                      titleStyle: TextStyle(
                                          fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                                    ), 
                                    PieChartSectionData(
                                      color: const Color(0xfff8b250),
                                      value: 20,
                                      title: '#sport',
                                      radius: radius,
                                      titleStyle: TextStyle(
                                          fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                                    ), 
                                    PieChartSectionData(
                                      color: const Color(0xff845bef),
                                      value: 30,
                                      title: '#eat',
                                      radius: radius,
                                      titleStyle: TextStyle(
                                          fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                                    ), 
                                    PieChartSectionData(
                                      color: const Color(0xff13d38e),
                                      value: 40,
                                      title: '#sleep',
                                      radius: radius,
                                      titleStyle: TextStyle(
                                          fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                                    ), 
                                  ], 
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Indicator(
                                    color: Color(0xff0293ee),
                                    text: '#dev',
                                    isSquare: true,
                                  ),
                                  Indicator(
                                    color: Color(0xff0293ee),
                                    text: '#sleep',
                                    isSquare: true,
                                  ),
                                  Indicator(
                                    color: Color(0xff0293ee),
                                    text: '#eat',
                                    isSquare: true,
                                  ),
                                  Indicator(
                                    color: Color(0xff0293ee),
                                    text: '#repeat',
                                    isSquare: true,
                                  ),
                                ],
                              ),
                            ]
                        ),    
                      ],
                    ),
                  ),
                  ///////////////////////////////////TAB WEEK
                 BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.center,
                    maxY: 20,
                    minY: -20,
                    groupsSpace: 12,
                    barTouchData: BarTouchData(
                      enabled: false,
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      topTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) => const TextStyle(color: Colors.white, fontSize: 10),
                        margin: 10,
                        rotateAngle: 0,
                        getTitles: (double value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'Mon';
                            case 1:
                              return 'Tue';
                            case 2:
                              return 'Wed';
                            case 3:
                              return 'Thu';
                            case 4:
                              return 'Fri';
                            case 5:
                              return 'Sat';
                            case 6:
                              return 'Sun';
                            default:
                              return '';
                          }
                        },
                      ),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) => const TextStyle(color: Colors.white, fontSize: 10),
                        margin: 10,
                        rotateAngle: 0,
                        getTitles: (double value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'Mon';
                            case 1:
                              return 'Tue';
                            case 2:
                              return 'Wed';
                            case 3:
                              return 'Thu';
                            case 4:
                              return 'Fri';
                            case 5:
                              return 'Sat';
                            case 6:
                              return 'Sun';
                            default:
                              return '';
                          }
                        },
                      ),
                      leftTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) => const TextStyle(color: Colors.white, fontSize: 10),
                        rotateAngle: 45,
                        getTitles: (double value) {
                          if (value == 0) {
                            return '0';
                          }
                          return '${value.toInt()}0k';
                        },
                        interval: 5,
                        margin: 8,
                        reservedSize: 30,
                      ),
                      rightTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) => const TextStyle(color: Colors.white, fontSize: 10),
                        rotateAngle: 90,
                        getTitles: (double value) {
                          if (value == 0) {
                            return '0';
                          }
                          return '${value.toInt()}0k';
                        },
                        interval: 5,
                        margin: 8,
                        reservedSize: 30,
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      checkToShowHorizontalLine: (value) => value % 5 == 0,
                      getDrawingHorizontalLine: (value) {
                        if (value == 0) {
                          return FlLine(color: const Color(0xff363753), strokeWidth: 3);
                        }
                        return FlLine(
                          color: const Color(0xff2a2747),
                          strokeWidth: 0.8,
                        );
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: [
                          BarChartRodData(
                            y: 15.1,
                            width: barWidth,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                            rodStackItems: [
                              BarChartRodStackItem(0, 2, const Color(0xff2bdb90)),
                              BarChartRodStackItem(2, 5, const Color(0xffffdd80)),
                              BarChartRodStackItem(5, 7.5, const Color(0xffff4d94)),
                              BarChartRodStackItem(7.5, 15.5, const Color(0xff19bfff)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                //],
                ),
      
                  ///////////////////////////////////TAB MONTH
                 Center( child: Text("month")),
                  ///////////////////////////////////TAB YEAR
                 Center( child: Text("year")),
               ],
            ),
          ),
        ),
      ),
    );
  }
}
