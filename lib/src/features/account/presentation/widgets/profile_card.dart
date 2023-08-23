import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom/src/features/common/common.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        25.0.vspace,
        GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: 40,
            backgroundImage: user.photoUrl != null
                ? CachedNetworkImageProvider(user.photoUrl!)
                : null,
          ),
        ),
        20.0.vspace,
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.displayName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              user.email,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ))
      ],
    );
  }
}
