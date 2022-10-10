class TargetTasksModel{

  final int id;

  final String titleTar;
  final int  weekNun;
  final int  y;
  final int  m;


  TargetTasksModel( this.id,   this.titleTar,  this.weekNun, this.y,this.m );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titleTar':titleTar,
      'weekNun':weekNun,
      'y':y,
      'm':m,

    };
  }

  TargetTasksModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        titleTar=res['titleTar'],
        y=res['y'],
        m=res['m'],
        weekNun=res['weekNun'];


// Implement toString to make it easier to see information about
// each dog when using the print statement.
  @override
  String toString() {
    return 'TargetTasks{id: $id,titleTar: $titleTar,weekNun: $weekNun,y: $y,m: $m,}';
  }
}
