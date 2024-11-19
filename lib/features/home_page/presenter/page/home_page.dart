import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_app/features/add_task/presenter/add_task_bottom_sheet.dart';
import 'package:todo_app/features/home_page/presenter/bloc/home_bloc.dart';
import 'package:todo_app/features/home_page/presenter/page/widgets/tab_views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/schedule_page/presenter/page/schedule_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: const _Page(),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Boards'),
            backgroundColor: Colors.white,
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.calendar_month),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SchedulePage())),
              ),
              const CircleAvatar(
                radius: 16,
                child: Text('A'),
                backgroundColor: Colors.grey,
              ),
              SizedBox(width: 20,)
            ],
          ),
          body: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Material(
                  color: Colors.white,
                  child: TabBar(
                    tabs: [
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Open'),
                            const SizedBox(
                              width: 2.5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                              ),
                              child: CircleAvatar(
                                radius: 12,
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Tab(
                        child: FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('In Progress'),
                              SizedBox(
                                width: 2.5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.orange,
                                  radius: 12,
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Done'),
                            SizedBox(
                              width: 2.5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 12,
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                TabViews(),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Colors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            backgroundColor: Colors.green,
            child: const Icon(
              Icons.add,
              size: 28,
              color: Colors.white,
            ),
            onPressed: () {
              showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  barrierColor: Colors.transparent,
                  builder: (context) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                      child: const AddTaskBottomSheet(),
                    );
                  });
            },
          ),
        );
      },
    );
  }
}
