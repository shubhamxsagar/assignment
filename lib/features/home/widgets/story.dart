import 'package:flutter/material.dart';
import 'package:mxpertx/core/themes/app_pallete.dart';

@immutable
class Story extends StatefulWidget {
  final image;
  final bool? field;
  const Story({super.key, required this.image, this.field = false});

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppPallete.gradient1!,
                width: 3,
              ),
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(widget.image),
            ),
          ),
          if (widget.field!)
            Positioned(
              bottom: 30,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: AppPallete.gradient1,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
