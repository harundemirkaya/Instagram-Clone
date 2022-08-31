import 'package:flutter/material.dart';
import 'package:instaclone/util/account_images_json.dart';
import 'package:instaclone/util/constant.dart';

import '../theme/colors.dart';

// ignore_for_file: prefer_const_constructors
class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(size),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: bgWhite,
      title: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 70),
        child: Row(children: [
          Icon(
            Icons.lock_open,
            color: Colors.black,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 70,
          ),
          Text(
            username,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                  color: textBlack,
                ),
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                  color: textBlack,
                ),
              ],
            )),
      ],
    );
  }

  Widget getBody(Size size) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: (size.width - 20) * 0.3,
                    child: Stack(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: bgGrey,
                            ),
                            image: DecorationImage(
                              image: NetworkImage(profile),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: size.width / 30,
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primary,
                              border: Border.all(width: 1, color: bgWhite),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: bgWhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: (size.width - 20) * 0.7,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              Text(
                                "10",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Posts",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5),
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              Text(
                                "331",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Followers",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5),
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              Text(
                                "345",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Following",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
              SizedBox(
                height: size.height / 80,
              ),
              Text(
                username,
                style: TextStyle(color: bgDark, fontWeight: FontWeight.bold),
              ),
              Text(instagramBio),
              SizedBox(
                height: size.height / 80,
              ),
              Container(
                height: size.height / 25,
                width: (size.width - 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: bgGrey),
                  borderRadius: BorderRadius.circular(5),
                  color: bgLightGrey,
                ),
                child: Center(
                  child: Text(
                    "Edit Profile",
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Story Highlights",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height / 80,
        ),
        Container(
          height: 0.5,
          width: size.width,
          decoration: BoxDecoration(
            color: bgGrey.withOpacity(0.8),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3),
          child: Row(children: [
            SizedBox(
              width: (size.width * 0.5),
              child: IconButton(
                splashRadius: 20,
                icon: Icon(
                  Icons.grid_on_outlined,
                  color: selectedIndex == 0 ? textBlack : textGrey,
                ),
                onPressed: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
              ),
            ),
            SizedBox(
              width: (size.width * 0.5),
              child: IconButton(
                splashRadius: 20,
                icon: Icon(
                  Icons.badge_outlined,
                  color: selectedIndex == 1 ? textBlack : textGrey,
                ),
                onPressed: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
              ),
            ),
          ]),
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                  height: 1,
                  width: (size.width * 0.5),
                  decoration: BoxDecoration(
                      color: selectedIndex == 0 ? bgDark : Colors.transparent),
                ),
                Container(
                  height: 1,
                  width: (size.width * 0.5),
                  decoration: BoxDecoration(
                      color: selectedIndex == 1 ? bgDark : Colors.transparent),
                ),
              ],
            ),
            Container(
              height: 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: bgGrey.withOpacity(0.8),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height / 90,
        ),
        IndexedStack(
          index: selectedIndex,
          children: [
            getImages(size, selectedIndex),
            getImages(size, selectedIndex),
          ],
        ),
      ],
    );
  }

  Widget getImages(size, indexSelect) {
    return Wrap(
        direction: Axis.horizontal,
        spacing: 3,
        runSpacing: 3,
        children: List.generate(
            indexSelect == 0 ? images.length : imageWithTags.length, (index) {
          return Container(
            height: 150,
            width: (size.width - 6) / 3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(indexSelect == 0
                        ? images[index]
                        : imageWithTags[index]),
                    fit: BoxFit.cover)),
          );
        }));
  }
}
