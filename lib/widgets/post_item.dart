import 'package:aplikasi01/pages/comment_create_page.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi01/resources/dimentions.dart';
import 'package:aplikasi01/widgets/post_action.dart';
import 'package:aplikasi01/widgets/post_title.dart';

import '../models/moment.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
    required this.moment,
  });

  final Moment moment;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: largeSize,
          vertical: mediumSize,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(extraLargeSize),
          image: DecorationImage(
            // image: AssetImage('assets/images/moments_background_dark.png'),
            image: NetworkImage(moment.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PostTitle(
              creator: moment.creator,
              location: moment.location,
            ),
            Padding(
              padding: const EdgeInsets.all(smallSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      PostAction(
                        icon: 'assets/icons/fi-br-heart.svg',
                        label: moment.likeCount.toString(),
                      ),
                      PostAction(
                        icon: 'assets/icons/fi-br-comment.svg',
                        label: moment.commentCount.toString(),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommentCreatePage(
                                onSaved: (Moment newMoment) {},
                              ),
                            ),
                          );
                        },
                      ),
                      PostAction(
                        icon: 'assets/icons/fi-br-bookmark.svg',
                        label: moment.bookmarkCount.toString(),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: largeSize, bottom: mediumSize),
                    child: Text(
                      moment.caption,
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
