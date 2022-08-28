import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instaclone/theme/colors.dart';
import 'package:instaclone/util/constant.dart';
import 'package:instaclone/util/new_feed_json.dart';
import 'package:instaclone/util/story_json.dart';

// ignore_for_file: prefer_const_constructors
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: bgWhite,
      title: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 70),
        width: 90,
        child: SvgPicture.asset("assets/images/logo.svg"),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Container(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.message,
                color: textBlack,
              ),
            ))
      ],
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(stories.length, (index) {
            return Padding(
              padding: EdgeInsets.all(3.0),
              child: SizedBox(
                width: 80,
                child: Column(children: [
                  Stack(
                    children: [
                      stories[index]['isStory'] == true
                          ? Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: bgStoryColors,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(width: 2, color: bgWhite),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        stories[index]['imageUrl'] as String,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 2, color: bgWhite),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      stories[index]['imageUrl'] as String,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                      stories[index]['isAdd'] == true
                          ? Positioned(
                              right: 5,
                              bottom: 0,
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primary,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: bgWhite,
                                    size: 20,
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 90,
                  ),
                  Text(
                    stories[index]['username'] as String,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ]),
              ),
            );
          })),
        ),
        Divider(),
        Column(
            children: List.generate(newFeeds.length, (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: bgStoryColors),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.3),
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 1, color: bgWhite),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      newFeeds[index]['profile'] as String),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 50,
                        ),
                        Text(
                          newFeeds[index]['username'] as String,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.menu,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 90,
              ),
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        newFeeds[index]['imageUrl'] as String,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          splashRadius: 15,
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/images/heart.svg",
                            width: 25,
                            height: 25,
                          ),
                        ),
                        IconButton(
                            splashRadius: 15,
                            onPressed: () {},
                            icon: Icon(
                              Icons.mode_comment_outlined,
                              size: 25,
                            )),
                        IconButton(
                          splashRadius: 15,
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/images/share.svg",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.bookmark_border))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${newFeeds[index]['likes'] as String} likes",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: newFeeds[index]['username'] as String,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: newFeeds[index]['caption'] as String,
                              style: TextStyle(height: 1.5)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    Text(
                      newFeeds[index]['comments'] as String,
                      style: TextStyle(color: textGrey),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width - 30) * 0.7,
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 1, color: bgGrey),
                                    image: DecorationImage(
                                      image: NetworkImage(profile),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              SizedBox(
                                height: 25,
                                width:
                                    (MediaQuery.of(context).size.width - 70) *
                                        0.6,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10, left: 10),
                                  child: TextField(
                                    cursorColor: textBlack.withOpacity(0.5),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Add a comment",
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: textBlack.withOpacity(0.5))),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width - 30) * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text("😍"),
                              SizedBox(
                                width: 8,
                              ),
                              Text("😂"),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.add_circle_outline,
                                size: 20,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.008,
                    ),
                    Text(
                      newFeeds[index]['dateTime'] as String,
                      style: TextStyle(fontSize: 12, color: textGrey),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    )
                  ],
                ),
              ),
            ],
          );
        }))
      ],
    );
  }
}
