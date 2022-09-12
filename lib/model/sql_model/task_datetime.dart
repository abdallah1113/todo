class TaskDatetimeModel{

  final int id;

  final int y;
  final int m;
  final int d;


  TaskDatetimeModel( this.id,  this.y,  this.m,  this.d,  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,

      'y':y,
      'm':m,
      'd':d,

    };
  }

  TaskDatetimeModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        y=res['y'],
        m=res['m'],
        d=res['d'];


// Implement toString to make it easier to see information about
// each dog when using the print statement.
  @override
  String toString() {
    return 'TaskDatetime{id: $id,y: $y,m: $m,d: $d}';
  }
}
