import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:myUiChallange/abstractions/StoryRepository.dart';
import 'package:myUiChallange/mocks/MockStoryRepository.dart';
import 'package:myUiChallange/model/Story.dart';

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
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Billabong',
            ),
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
        body: Container(
          child: getStoriesWidget(),
          margin: EdgeInsets.only(top: 5.0),
        ));
  }

  Widget _getProfileStoryWidget(Story story) {
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 75.0,
                height: 75.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(story.authorImageUri),
                  ),
                ),
              ),
              Align(
                alignment: FractionalOffset.topRight,
                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: () => {},
                  child: Icon(
                    Icons.add,
                    color: Colors.blue,
                    size: 35,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 9.0),
          Text('Your Story', style: TextStyle(color: Colors.grey))
        ],
      ),
    );
  }

  Widget _getStoryWidget(Story story) {
    return Container(
      margin: EdgeInsets.only(left: 23.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: NetworkImage(story.authorImageUri),
              ),
            ),
          ),
          SizedBox(height: 9.0),
          Text(
            story.authorName,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          )
        ],
      ),
    );
  }

  Widget getStoriesWidget() {
    var stories = List<Story>();
    stories.add(_storyRepository.getProfileStory());
    stories.addAll(_storyRepository.getStories());
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemCount: stories.length,
        itemBuilder: (BuildContext context, int index) {
          var story = stories[index];
          return story.isProfileStory
              ? _getProfileStoryWidget(story)
              : _getStoryWidget(story);
        });
  }

  Widget getFeedsWidget() {
    return Text('Feeds');
  }
}
