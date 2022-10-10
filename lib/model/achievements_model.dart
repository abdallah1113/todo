class AchievementsModel {



  final int id;

  final String title;
  final int  point;
  final int  y;
  final int  m;


  AchievementsModel( this.id,   this.title,  this.point, this.y,this.m );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title':title,
      'point':point,
      'y':y,
      'm':m,

    };
  }

  AchievementsModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title=res['title'],
        y=res['y'],
        m=res['m'],
        point=res['point'];


// Implement toString to make it easier to see information about
// each dog when using the print statement.
  @override
  String toString() {
    return 'Achievements{id: $id,title: $title,point: $point,y: $y,m: $m,}';
  }
}