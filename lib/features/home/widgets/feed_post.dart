import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class FeedPost extends StatefulWidget {
  String imageFeed;
  FeedPost({super.key, required this.imageFeed});

  @override
  State<FeedPost> createState() => _FeedPostState();
}

class _FeedPostState extends State<FeedPost> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(widget.imageFeed, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset('assets/svg/message.svg'),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: SvgPicture.asset('assets/svg/comment.svg'),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: SvgPicture.asset('assets/svg/share.svg'),
                      onPressed: () {},
                    ),
                  ],
                ),
                IconButton(
                  icon: SvgPicture.asset('assets/svg/save.svg'),
                  onPressed: () {
                    // Save button onPressed action
                  },
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CircleAvatar(
                  radius: 10,
                  backgroundImage: AssetImage(
                      widget.imageFeed), // Replace with your image asset
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Add a comment...',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ],
      ),
    );
  }
}
