class Story{
  String images;
  String name;

  Story({required this.images,required this.name});
}
class Post{
  String? postName;
  String? postPlaceName;
  String? postImage;
  double? numberlike;
  String? text;
  List<String>? likedName=[];

  Post({required this.postName,required this.postPlaceName,required this.postImage,required this.numberlike,this.text,required  this.likedName});
}