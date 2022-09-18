import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/presentation/journeys/drawer/navigation_expanded_list_tile.dart';
import 'package:tb_movie_app/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:tb_movie_app/presentation/widget/logo.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                bottom: 20.h,
                left: 20.w,
              ),
              child: Logo(
                height: 20.h,
              ),
            ),
            NavigationListItem(title: 'Favourite Movies', onPressed: () {}),
            NavigationExpandedListItem(
              title: 'Language',
              onPressed: () {},
              children: ['English', 'Spanish'],
            ),
            NavigationListItem(title: 'Feedback', onPressed: () {}),
            NavigationListItem(title: 'About', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
