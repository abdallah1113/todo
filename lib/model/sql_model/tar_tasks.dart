class TasksTarModel{

  final int id;
  final String idUser;

  final String titleTar;
  final String numTar;


  TasksTarModel( this.id, this.idUser,   this.titleTar,  this.numTar,  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idUser': idUser,
      'titleTar':titleTar,
      'numTar':numTar,
    };
  }

  TasksTarModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        idUser = res["idUser"],
        titleTar=res['titleTar'],
        numTar=res['numTar'];


// Implement toString to make it easier to see information about
// each dog when using the print statement.
  @override
  String toString() {
    return 'TasksTar{id: $id, idUser: $idUser,titleTar: $titleTar,numTar: $numTar,}';
  }
}
