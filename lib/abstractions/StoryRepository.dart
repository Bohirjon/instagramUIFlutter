import 'package:myUiChallange/model/Story.dart';

abstract class StoryRepository {
  Story getProfileStory();

  List<Story> getStories();
}
