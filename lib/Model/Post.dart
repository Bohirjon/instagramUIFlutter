class Post {
  Post(
      {this.authorName,
      this.authorProfileImageUri,
      this.postContentImageUri,
      this.totalLikes,
      this.specialLikedName,
      this.postedOn});
  String authorName;
  String authorProfileImageUri;

  String postContentImageUri;
  int totalLikes;

  String specialLikedName;
  DateTime postedOn;
}
