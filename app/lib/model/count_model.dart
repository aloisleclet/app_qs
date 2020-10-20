class Count {

      int id;
      String word;
      Datetime updateAt;

      Count();

      // convenience constructor to create a Count object
      Count.fromMap(Map<String, dynamic> map) {
        id = map[columnId];
        count = map[columnCount];
        updateAt = map[columnUpdateAt];
      }

      // convenience method to create a Map from this Count object
      Map<String, dynamic> toMap() {
        var map = <String, dynamic>{
          columnCount: count,
          columnUpdateAt : updateAt
        };
        if (id != null) {
          map[columnId] = id;
        }
        return map;
      }
}

