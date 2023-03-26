import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    Key? key,
    required this.MealTitle,
    required this.shareLink,
  }) : super(key: key);
  final String shareLink;
  final String MealTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 5,
        ),
        IconButton(
          onPressed: () {
            Share.share(
              'Look How to Cook this $MealTitle ? check it Now $shareLink',
            );
          },
          icon: const Icon(
            Icons.share,
            size: 25,
          ),
          color: Colors.green,
        ),
      ],
    );
  }
}