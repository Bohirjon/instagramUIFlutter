import 'package:flutter/cupertino.dart';

class Story {
  Story(this.isProfileStory,
      {@required this.authorName,
      @required this.authorImageUri,
      @required this.storyContentImageUri});

  bool isProfileStory;
  String authorName;

  String authorImageUri;
  String storyContentImageUri;
}
