class UsersModel{

  final String idUser;
  final String name;
  final String img;
  final String email;
  final String pass;


  UsersModel( this.idUser, this.name,   this.img,  this.email,  this.pass,  );

  Map<String, dynamic> toMap() {
    return {
      'idUser': idUser,
      'name': name,
      'img':img,
      'email':email,
      'pass':pass,

    };
  }

  UsersModel.fromMap(Map<String, dynamic> res)
      : idUser = res["idUser"],
        name = res["name"],
        img=res['img'],
        email=res['email'],
      pass=res['pass'];


// Implement toString to make it easier to see information about
// each dog when using the print statement.
  @override
  String toString() {
    return 'Users{idUser: $idUser,  name: $name,  img:$img,  email:$email,  pass: $pass}';
  }
}
