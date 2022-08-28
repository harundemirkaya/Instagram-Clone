import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
class NewPostPage extends StatefulWidget {
  const NewPostPage({Key? key}) : super(key: key);

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("New Post Page")),
    );
  }
}
