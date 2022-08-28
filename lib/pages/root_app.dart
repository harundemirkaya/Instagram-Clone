import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instaclone/pages/account_page.dart';
import 'package:instaclone/pages/activity_page.dart';
import 'package:instaclone/pages/home_page.dart';
import 'package:instaclone/pages/new_post_page.dart';
import 'package:instaclone/pages/search_page.dart';
import 'package:instaclone/theme/colors.dart';
import 'package:instaclone/util/bottom_navigation_bar_json.dart';

// ignore_for_file: prefer_const_constructors
class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: indexPage,
      children: const [
        HomePage(),
        SearchPage(),
        NewPostPage(),
        ActivityPage(),
        AccountPage(),
      ],
    );
  }

  Widget getBottomNavigationBar() {
    return Container(
      height: MediaQuery.of(context).size.height / 15,
      decoration: BoxDecoration(
        color: bgLightGrey,
        border: Border(
          top: BorderSide(
            width: 1,
            color: bgDark.withOpacity(0.3),
          ),
        ),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(icons.length, (index) {
            return IconButton(
              onPressed: () {
                setState(() {
                  indexPage = index;
                });
              },
              icon: SvgPicture.asset(
                indexPage == index
                    ? icons[index]['active']!
                    : icons[index]['inactive']!,
                width: 25,
                height: 25,
              ),
            );
          })),
    );
  }
}
