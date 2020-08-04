import 'package:myUiChallange/abstractions/StoryRepository.dart';
import 'package:myUiChallange/model/Story.dart';

class MockStoryRepository extends StoryRepository {
  @override
  Future<List<Story>> getStories() async {
    await Future.delayed(Duration(seconds: 2));
    var result = List<Story>();

    return result;
  }
}
