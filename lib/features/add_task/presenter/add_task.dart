import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/home_page/presenter/bloc/home_bloc.dart';

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({super.key, });

  @override
  Widget build(BuildContext context) {

    return FractionallySizedBox(
      heightFactor: 0.8,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Task name or type "/" for commands',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('In'),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Row(
                      children: [
                        const Expanded(
                          child: SearchBar(
                            leading: Icon(Icons.search),
                            elevation: WidgetStatePropertyAll(0),
                            backgroundColor: WidgetStatePropertyAll(Colors.white),
                            side: WidgetStatePropertyAll<BorderSide>(BorderSide(color: Colors.black,width: 1))
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('For'),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.access_time, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Description or type "/" for commands',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  TextButton.icon(
                    icon: const Icon(Icons.add, color: Colors.green),
                    label: const Text(
                      'Add Subtask',
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 16),
                  TextButton.icon(
                    icon: const Icon(Icons.add, color: Colors.green),
                    label: const Text(
                      'Add Checklist',
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const Text('Drag & Drop files to attach for Browse'),
                    const SizedBox(height: 8),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.attach_file),
                      label: const Text('Browse'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[100],
                        foregroundColor: Colors.amber[900],
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.timer),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.flag),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.view_agenda),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {
                      context.read<HomeBloc>().add(
                            const CreateTaskRequestedEvent(
                              title: '',
                              description: '',
                              list: '',
                            ),
                          );
                    },
                    child: const Text('Create Task'),
                  ),
                ],
              ),
            ],
          ),
        
      ),
    );
  }
}
