class Video {
  String? username;
  String? uid;
  String? id;
  double? likes;
  int? commentCount;
  int? shareCount;
  String? songName;
  String? caption;
  String? videoUrl;
  String? thumbnail;
  String? profilePhoto;
  List<Comment>? comments;

  Video({
     this.username,
     this.uid,
     this.id,
     this.likes,
     this.commentCount,
     this.shareCount,
     this.songName,
     this.caption,
     this.videoUrl,
     this.profilePhoto,
     this.thumbnail,
    this.comments
  });}

class Comment {
 UserProfile? messagedBy;

 Comment(
     {this.messagedBy,
      this.message,
      this.createdOn,
      this.likes,
      this.replies});

  String? message;
 String? createdOn;
 int? likes;
 List<Comment>? replies;
}

class UserProfile{
  String? image;

  UserProfile({this.image, this.name});

  String? name;

}