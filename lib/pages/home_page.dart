import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instaclone/theme/colors.dart';
import 'package:instaclone/util/story_json.dart';

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
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(3.0),
              child: Container(
                width: 80,
                child: Column(children: [
                  Stack(
                    children: [
                      Container(
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
                              border: Border.all(width: 2, color: bgWhite),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ]),
              ),
            )
          ],
        )
      ],
    );
  }
}
