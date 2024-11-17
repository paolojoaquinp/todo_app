import 'package:flutter/material.dart';
import 'package:todo_app/features/home_page/presenter/children/in_progress_tasks/presenter/in_progress_tab.dart';

class TabViews extends StatelessWidget {
  const TabViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Flexible(
      child: TabBarView(
        children: [
          Center(child: Text("page1"),),
          InProgressTab(),
          Center(child: Text("page3"),),
//          FavoriteRestaurantsTab(),
        ],
      ),
    );
  }
}
