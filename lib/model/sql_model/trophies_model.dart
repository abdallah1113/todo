class TrophiesModel {

  final int id;

  final String title;
  final int  nun;
  final int  y;
  final int  m;


  TrophiesModel( this.id,   this.title,  this.nun, this.y,this.m );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title':title,
      'nun':nun,
      'y':y,
      'm':m,

    };
  }

  TrophiesModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title=res['title'],
        y=res['y'],
        m=res['m'],
        nun=res['nun'];


// Implement toString to make it easier to see information about
// each dog when using the print statement.
  @override
  String toString() {
    return 'Trophies{id: $id,title: $title,nun: $nun,y: $y,m: $m,}';
  }
}