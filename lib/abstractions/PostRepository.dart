import 'package:myUiChallange/model/Post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}
