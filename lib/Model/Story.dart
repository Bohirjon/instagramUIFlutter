import 'package:flutter/cupertino.dart';

class Story {
  Story(
      {@required this.authorName,
      @required this.authorImageUri,
      @required this.storyContentImageUri});

  String authorName;

  String authorImageUri;
  String storyContentImageUri;
}
