import 'dart:io';
import 'dart:core';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


//models
import 'package:app/model/activity_model.dart';


// singleton class to manage the database
class DatabaseHelper {

  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "qs.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL string to create the database 
  Future _onCreate(Database db, int version) async {

    //timestamp type, auto increment, can cause error
    await print('>>>>>>>>>>>>>>_onCreate');
    await db.execute('''
          CREATE TABLE activities (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            id_activity_type INT NOT NULL,
            feedback TEXT NOT NULL,
            start_at TIMESTAMP NOT NULL,
            end_at TIMESTAMP NOT NULL 
          );
          
          CREATE TABLE activity_types (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            label VARCHAR(100) NOT NULL
          );
          
          CREATE TABLE challenges (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            label VARCHAR(100) NOT NULL,
            recurrency VARCHAR(100),
            done_at TIMESTAMP NOT NULL
          );
          
          CREATE TABLE achievements (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            level INTEGER NOT NULL,
            label VARCHAR(100) NOT NULL,
            achieve_at TIMESTAMP NOT NULL
          );

          ''');
    await print('>>>>>>>>>>>>>>>>>>_db.execute done.');
  }



  // Database helper methods:
 
  void reset() async
  {
    //await db.query('''SHOW DATABASES''').then((res) {
    //  print(res); 
    //});
  }

  Future<int> insertActivity(Activity activity) async {
    Database db = await database;
    await print('>>>>>>>>>>>>>>>>>launch insertion');
    int id = await db.insert('activities', activity.toMap());
    await print('>>>>>>>>>>>>>>>>>insertion done');
    return id;
  }
  
  Future<dynamic> getAllActivities() async {
    Database db = await database;
    List<Map<String, dynamic>> activities = [];
    
    List<Map> maps = await db.query(
      'activities',
      columns: ['id_activity_type', 'feedback', 'start_at', 'end_at']
    );
       
    for (int i = 0; i < maps.length; i++)
    {
      print(maps[i]);
      Map<String, dynamic> map = maps[i];
      activities.add(map);
    }
    return activities;
  }

  //Future<Count> queryCount(int id) async {
  //  Database db = await database;
  //  List<Map> maps = await db.query(tableWords,
  //      columns: [columnId, columnCount, columnUpdateAt],
  //      where: '$columnId = ?',
  //      whereArgs: [id]);
  //  if (maps.length > 0) {
  //    return Count.fromMap(maps.first);
  //  }
  //  return null;
  //}
  
  // TODO: getAllActivitiesDone()
  // TODO: getAllActivities()
  // TODO: getAllChallenges()
  // TODO: getAllAchievements()

  // TODO :insertActivitiesDone()
  // TODO :insertActivities()
  // TODO :insertChallenges()
  // TODO :insertAchievement()

  // step 2

  // TODO: deleteActvitiesDone()
  // TODO: deleteActvities()
  // TODO: deleteChallenges()
  // TODO: deleteAchievements()
  
  // TODO: updateActivitiesDone()
  // TODO: updateActivities()
  // TODO: updateChallenges()
  // TODO: updateAchievements()


}
