import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/schedule_page/presenter/bloc/schedule_bloc.dart';
import 'package:todo_app/features/schedule_page/presenter/page/widgets/custom_select.dart';
import 'package:todo_app/features/schedule_page/presenter/page/widgets/date_card.dart';
import 'package:todo_app/features/schedule_page/presenter/page/widgets/schedule_card.dart';
import 'package:todo_app/features/schedule_page/presenter/page/widgets/schedule_line_painter.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScheduleBloc>(
      create: (context) => ScheduleBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F8),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomSelect(
                        value: 'January',
                        items: const ['January', 'February', 'March'],
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomSelect(
                        value: 'All Project',
                        items: const ['All Project', 'Project A', 'Project B'],
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Date Cards
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final dates = ['24', '25', '26', '27', '28'];
                      final days = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed'];
                      return DateCard(
                        date: dates[index],
                        day: days[index],
                        isSelected: index == 2,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Schedule List
                Expanded(
                  child: Stack(
                    children: [
                      ListView(
                        children: const [
                          ScheduleCard(
                            title: 'Research cashback',
                            subtitle: 'Analytic consument behaviour',
                            time: '11:00',
                            backgroundColor: Color(0xFFFFF8E8),
                            participants: 3,
                          ),
                          ScheduleCard(
                            title: 'Customer ads Meetings',
                            subtitle: '14:00 - 15:30',
                            time: '14:00',
                            backgroundColor: Color(0xFFE8F8FF),
                            participants: 2,
                            hasVideoCall: true,
                          ),
                          ScheduleCard(
                            title: 'Update Report Sales',
                            subtitle: '17:00 - 17:30',
                            time: '17:00',
                            backgroundColor: Color(0xFFF8E8FF),
                            participants: 1,
                          ),
                        ],
                      ),
                      CustomPaint(
                        size: Size.infinite,
                        painter: ScheduleLinePainter(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
