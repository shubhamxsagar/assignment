import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mxpertx/features/home/widgets/feed_post.dart';
import 'package:mxpertx/features/home/widgets/story.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset('assets/skenu.png'),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {},
              ),
            ],
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 11,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Story(
                    field: true,
                    image: 'assets/girl1.png',
                  );
                } else {
                  return Story(
                    image: images[index - 1],
                  );
                }
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return FeedPost(
                  imageFeed: images[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
