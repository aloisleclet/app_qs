
class Activity {

  int id;
  int idActivityType;
  String feedback;
  int startAt; //timestamp
  int endAt; //timestamp
  
  static final columns = ["id", "id_activity_type", "feedback", "start_at", "end_at"];
  
  Activity();
  
  // convenience constructor to create an ActivityDone object
  Activity.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    idActivityType = map['id_activity_type'];
    feedback = map['feedback'];
    startAt = map['start_at'];
    endAt = map['end_at'];
  }
  
  // convenience method to create a Map from this Count object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'id_activity_type': idActivityType,
      'feedback': feedback,
      'start_at' : startAt,
      'end_at' : endAt
    };

    if (id != null)
      map['id'] = id;
    return map;
  }
}

