class Room{
  String id,title,description,category;


  Room({ this.id="", required this.title,required  this.description, required this.category});

  Room.fromJson(Map<String,dynamic>json):this(
      id: json["id"],
    title: json["title"],
    description: json["description"],
    category: json["category"]

  );
  Map<String,dynamic>toJson(){
    return{
      "id":id,
      "title":title,
      "description":description,
      "category":category
    };

  }

}