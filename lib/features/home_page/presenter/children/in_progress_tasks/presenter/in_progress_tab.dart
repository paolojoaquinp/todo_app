import 'package:flutter/material.dart';
import 'package:todo_app/features/home_page/presenter/children/in_progress_tasks/presenter/widgets/task_card.dart';

class InProgressTab extends StatelessWidget {
  const InProgressTab({super.key});

  @override
  Widget build(BuildContext context) {
  //  return BlocBuilder<TaskBloc, TaskState>(
  //    builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            TaskCard(
              title: 'Research cashback payment',
              subtitle: 'Analytic consumer behaviour',
              memberCount: 4,
            ),
            SizedBox(height: 16),
            TaskCard(
              title: 'Cart payment page',
              subtitle: 'Payment flow + interactions',
              memberCount: 1,
              showImage: true,
            ),
          ],
        );
    //  },
  //  );
  }
}
