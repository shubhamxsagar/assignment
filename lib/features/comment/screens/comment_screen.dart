import 'package:flutter/material.dart';
import 'package:mxpertx/core/themes/app_pallete.dart';
import 'package:mxpertx/features/comment/widgets/comments_widget.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  List<String> images = [
    'assets/girl1.png',
    'assets/man.png',
    'assets/bg_1.png',
    'assets/girl1.png',
    'assets/man.png',
    'assets/bg_1.png',
    'assets/girl1.png',
    'assets/man.png',
    'assets/girl1.png',
    'assets/man.png',
  ];

  List<String> names = [
    'Jane Doe',
    'Mark John',
    'Williams',
    'Irene',
    'Oscar',
    'Moses K',
    'Ojukwu',
    'Chinua',
    'Williams',
    'Irene',
  ];

  List<String> comments = [
    'This is a comment',
    'Hi there',
    'Nice one',
    'I love this',
    'This is a comment',
    'Oh wow',
    'Lol this is funny',
    'This is a comment',
    'Hi there',
    'Nice one',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comment',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor:
            AppPallete.gradient1, // Set the AppBar background color to yellow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), // Adjust the radius as needed
            bottomRight: Radius.circular(10), // Adjust the radius as needed
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return CommentsList(image: images[index], name: names[index], comment: comments[index]);
          }),
    );
  }
}
