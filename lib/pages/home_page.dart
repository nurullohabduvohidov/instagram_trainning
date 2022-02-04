import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:training/models/classes.dart';

class HomePage extends StatefulWidget {
  static final String id = "";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Story> story = [
    Story(images: "assets/images/afshin.jpg", name: "Afshin"),
    Story(images: "assets/images/hakim.jpg", name: "Hakim"),
    Story(images: "assets/images/luis.jpg", name: "Luis"),
    Story(images: "assets/images/tyler.jpg", name: "Tyler"),
    Story(images: "assets/images/mahdi.jpg", name: "Mahdi"),
  ];

  List<Post> postList = [
    Post(
        postName: "imnurulloh",
        postPlaceName: "Khanabadskiy, Andijon, Uzbekistan",
        postImage: "assets/images/mahdi.jpg",
        numberlike: 56.456,
        likedName: ["cristiano", "leomessi"],
        text: "Flutter B14"
    ),
    Post(
        postName: "cristiano",
        postPlaceName: "Lissabon",
        postImage: "assets/images/hakim.jpg",
        numberlike: 323.446,
        likedName: ["imnurulloh", "leomessi"],
        text: "At home"),
    Post(
        postName: "leomessi",
        postPlaceName: "Paris",
        postImage: "assets/images/luis.jpg",
        numberlike: 455.556,
        likedName: ["imnurulloh", "cristiano"],
        text: "With PSG"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      ///AppBar
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(
          FontAwesomeIcons.camera,
          color: Colors.grey,
        ),
        title: Text(
          "Instagram",
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.tv),
          SizedBox(
            width: 15,
          ),
          Icon(
            FontAwesomeIcons.telegramPlane,
            color: Colors.grey,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),

      ///body
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///stories
            Container(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Stories",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Watch All",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            ///storyProfiles
            Container(
              height: 119,
              padding: EdgeInsets.only(left: 10, right: 20, top: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return buildStory(index);
                },
                itemCount: story.length,
              ),
            ),
            SizedBox(
              height: 10,
            ),

            ///post
            Container(
              child: ListView.builder(
                itemCount: postList.length,
                itemBuilder: (ctx, index) {
                  return buildPost(postList[index]);
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Column buildPost(Post postList) {
    return Column(
      children: [
        Container(
          height: 350,
          child: GridTile(
            header: GridTileBar(
              backgroundColor: Colors.black,
              leading: CircleAvatar(
                backgroundColor: Colors.deepOrange,
              ),
              title: Text(postList.postName!),
              subtitle: Text(postList.postPlaceName!),
              trailing: Icon(Icons.more_horiz),
            ),
            child: Image.asset(
              postList.postImage!,
              fit: BoxFit.cover,
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black,
              title: Row(
                children: [
                  Icon(FontAwesomeIcons.heart),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(FontAwesomeIcons.comment),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(FontAwesomeIcons.telegramPlane),
                ],
              ),
              trailing: Icon(FontAwesomeIcons.bookmark),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 15, top: 8),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Liked By",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${postList.likedName!.first},${postList.likedName!.last}",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    " and ${postList.numberlike}",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "${postList.postName}",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    postList.text!,
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Container buildStory(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ///images
          Container(
            height: 80,
            width: 80,
            child: Container(
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(story[index].images),
                ),
                color: Colors.green,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 2),
                borderRadius: BorderRadius.circular(40)),
          ),
          SizedBox(
            height: 10,
          ),

          ///text
          Text(
            story[index].name,
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
