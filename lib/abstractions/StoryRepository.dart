import 'package:myUiChallange/model/Story.dart';

abstract class StoryRepository {
  Future<List<Story>> getStories();
}