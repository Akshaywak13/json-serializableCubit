class UserModel {
  late String id;
  late String fullname;
  late String email;

  UserModel({required this.id, required this.email, required this.fullname});
   
    // MAP TO OBJECT
  UserModel.fromMap(Map<String,dynamic>map){
    this.id = map["id"];
    this.fullname = map["fullname"];
    this.email = map["email"];
  }

  // OBJECT TO MAP
  Map<String,dynamic> toMap(){
    return {
      "id": this.id,
      "fullname": this.fullname,
      "email": this.email,
    };
  }
}