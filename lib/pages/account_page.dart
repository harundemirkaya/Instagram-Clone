import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instaclone/util/constant.dart';

import '../theme/colors.dart';

// ignore_for_file: prefer_const_constructors
class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
                  Container(
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
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
