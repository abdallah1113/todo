class TasksModel{

  final int id;
  final String idUser;

  final String title;
  final String subtitle;
  final int isDone;
  final int y;
  final int m;
  final int d;


  TasksModel( this.id, this.idUser,   this.title,  this.subtitle,  this.isDone,  this.y,  this.m,  this.d,  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idUser': idUser,
      'title':title,
      'isDone':isDone,
      'subtitle':subtitle,
      'y':y,
      'm':m,
      'd':d,

    };
  }

  TasksModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        idUser = res["idUser"],
        title=res['title'],
        subtitle=res['subtitle'],
        isDone=res['isDone'],
        y=res['y'],
        m=res['m'],
        d=res['d'];


// Implement toString to make it easier to see information about
// each dog when using the print statement.
  @override
  String toString() {
    return 'Tasks{id: $id, idUser: $idUser,title: $title,subtitle: $subtitle,isDone: $isDone,y: $y,m: $m,d: $d}';
  }
}
