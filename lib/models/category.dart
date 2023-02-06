class RoomCategory{
  String id;
  late String name,image;

  RoomCategory(this.id, this.name, this.image);
  RoomCategory.fromId(this.id){
    name=id;
    image="assets/images/$id.png";
  }
  static List<RoomCategory>getCategory(){
    return[
      RoomCategory.fromId('movies'),
      RoomCategory.fromId('music'),
      RoomCategory.fromId('sports'),
    ];
  }

}