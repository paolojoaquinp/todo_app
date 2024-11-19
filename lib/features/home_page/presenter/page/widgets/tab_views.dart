import 'package:flutter/material.dart';
import 'package:todo_app/features/home_page/presenter/children/done_tasks/presenter/done_tasks_tab.dart';
import 'package:todo_app/features/home_page/presenter/children/in_progress_tasks/presenter/in_progress_tab.dart';
import 'package:todo_app/features/home_page/presenter/children/open_tasks/presenter/open_tasks_tab.dart';
import 'package:todo_app/features/schedule_page/presenter/page/schedule_page.dart';

class TabViews extends StatelessWidget {
  const TabViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Flexible(
      child: TabBarView(
        children: [
          OpenTasksTab(),
          InProgressTab(),
          DoneTasksTab(),
        ],
      ),
    );
  }
}
