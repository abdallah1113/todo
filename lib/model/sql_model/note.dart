class NoteModel {

  final int id;

  final String title;
  final int y;
  final int m;
  final int d;


  NoteModel( this.id, this.title,   this.y,  this.m,  this.d,   );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'y': y,
      'm':m,
      'd':d,

    };
  }

  NoteModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["title"],
        y = res["y"],
        m=res['m'],
        d=res['d'];

// Implement toString to make it easier to see information about
// each dog when using the print statement.
  @override
  String toString() {
    return 'NoteTask{id: $id, title: $title  ,y: $y  ,m: $m,  d: $d, }';
  }
}
