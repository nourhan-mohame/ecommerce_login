class catgeroy_data{
  int? id;
  String? title;
  String? createdat;
  String? imageUrl;


  catgeroy_data({required String id, required title, required createdAt, required imageUrl});

  catgeroy_data.fromJson(Map<String,dynamic>data){
    id=data['id'] as int?;
    createdat=data['category']as String?;
    title=data['name']as String?;
    imageUrl=data['imageUrl']as String?;

  }

Map<String,dynamic> toJson() {
  return {
    "id": id,
    "createdat": createdat,
    "title": title,
    "imageUrl": imageUrl,

  };
}
}