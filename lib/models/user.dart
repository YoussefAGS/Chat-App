class MyUser{
  String id,firstName,userName,email;

  MyUser({required this.id, required this.firstName,required this.userName, required this.email});



  MyUser.fromJson(Map<String,dynamic>json):this(
      id:json['id'],
      firstName:json['firstName'],
      userName:json['userName'],
      email:json['email']
  );
  Map<String,dynamic>toJson(){
    return{
      "id":id,
      "firstName":firstName,
      "userName":userName,
      "email":email
    };

}

}