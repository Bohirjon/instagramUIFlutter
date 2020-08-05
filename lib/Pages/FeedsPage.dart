import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myUiChallange/abstractions/StoryRepository.dart';
import 'package:myUiChallange/mocks/MockStoryRepository.dart';

class FeedsPage extends StatelessWidget {
//  final PostRepository _postRepository = MockPostRepository();
  final StoryRepository _storyRepository = MockStoryRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Center(
            child: Icon(
              Icons.camera_alt,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Instagram',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            Transform.rotate(
              angle: -0.5,
              child: Icon(
                Icons.send,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: getStoryWidget());
  }

  Widget getStoryWidget() {
    var stories = _storyRepository.getStories();
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemCount: stories.length,
        itemBuilder: (BuildContext context, int index) {
          var story = stories[index];
          return Column(
            children: <Widget>[
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(story.authorImageUri),
                  ),
                ),
              ),
              Text(story.authorName)
            ],
          );
        });
  }

  Widget getFeedsWidget() {
    return Text('Feeds');
  }
}
