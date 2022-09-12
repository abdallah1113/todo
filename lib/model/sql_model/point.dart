class PointModel {

  final String idUser;
  final int tasksPo;

  final int workPo;
  final int personPo;
  final int studyPo;

  final int anotherOP;
  final int notDone;


  PointModel( this.idUser, this.tasksPo,   this.workPo,  this.studyPo,  this.anotherOP,  this.personPo,  this.notDone,  );

  Map<String, dynamic> toMap() {
    return {
      'idUser': idUser,
      'workPo': workPo,
      'tasksPo': tasksPo,

      'studyPo':studyPo,
      'anotherOP':anotherOP,
      'personPo':personPo,
      'notDone':notDone,

    };
  }

  PointModel.fromMap(Map<String, dynamic> res)
      : idUser = res["idUser"],
        tasksPo = res["tasksPo"],

      workPo = res["workPo"],
        studyPo=res['studyPo'],
        anotherOP=res['anotherOP'],
        personPo=res['personPo'],
        notDone=res['notDone'];

// Implement toString to make it easier to see information about
// each dog when using the print statement.
  @override
  String toString() {
    return 'Point{idUser: $idUser, tasksPo: $tasksPo  ,workPo: $workPo  ,studyPo: $studyPo,  anotherOP: $anotherOP,  personPo: $personPo,  notDone: $notDone}';
  }
}
