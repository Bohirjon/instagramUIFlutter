import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:myUiChallange/abstractions/PostRepository.dart';
import 'package:myUiChallange/abstractions/StoryRepository.dart';
import 'package:myUiChallange/mocks/MockPostRepository.dart';
import 'package:myUiChallange/mocks/MockStoryRepository.dart';
import 'package:myUiChallange/model/Post.dart';
import 'package:myUiChallange/model/Story.dart';

class FeedsPage extends StatelessWidget {
  final PostRepository _postRepository = MockPostRepository();
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
                fontSize: 32.0,
                fontStyle: FontStyle.normal),
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
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black87,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Container()),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Container()),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box), title: Container()),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), title: Container()),
            BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Opacity(
                    opacity: 0.85,
                    child: Image.network(
                        'https://avatars1.githubusercontent.com/u/17494227?s=460&u=e176633da165ef7d3a053e1073511ddbe59d21c9&v=4'),
                  ),
                  height: 22.0,
                  width: 22.0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                ),
                title: Container()),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              child: _getStoriesWidget(),
              height: 120.2,
            ),
            Expanded(child: _getFeedsWidget())
          ],
        ));
  }

  Widget _getProfileStoryWidget(Story story) {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 5),
      child: Stack(
        children: <Widget>[
          Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(story.authorImageUri),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 0.2,
            child: IconButton(
              color: Colors.transparent,
              onPressed: () => {},
              icon: Icon(
                Icons.add_circle,
                color: Colors.blue,
                size: 20,
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              child: Text('Your Story', style: TextStyle(color: Colors.grey))),
        ],
      ),
    );
  }

  Widget _getStoryWidget(Story story) {
    return Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.pink, width: 2.3)),
            child: Container(
              width: 70.0,
              height: 70.0,
              margin: EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(story.authorImageUri),
                ),
              ),
            ),
          ),
          SizedBox(height: 4.0),
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

  Widget _getStoriesWidget() {
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

  Widget _getFeedWidget(Post post) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 0.15,
            width: double.infinity,
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Row(children: <Widget>[
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Container(
                  width: 35.0,
                  height: 35.0,
                  margin: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(post.authorProfileImageUri),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                post.authorName,
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              Positioned(
                right: 10,
                child: IconButton(icon: Icon(Icons.more_vert)),
              )
            ]),
          ),
          Image.network(post.postContentImageUri),
          Container(
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.black87,
                    size: 30.0,
                  ),
                ),
                IconButton(icon: Image(image: AssetImage('assets/topic.png')))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getFeedsWidget() {
    var feeds = _postRepository.getPosts();
    return ListView.builder(
      itemCount: feeds.length,
      itemBuilder: (context, index) {
        var post = feeds[index];
        return _getFeedWidget(post);
      },
    );
  }
}
