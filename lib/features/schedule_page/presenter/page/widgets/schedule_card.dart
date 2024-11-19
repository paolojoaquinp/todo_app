import 'package:flutter/material.dart';
class ScheduleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final Color backgroundColor;
  final int participants;
  final bool hasVideoCall;

  const ScheduleCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.backgroundColor,
    required this.participants,
    this.hasVideoCall = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: Text(
              time,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 2)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 32,
                        child: Stack(
                          children: List.generate(
                            participants,
                            (index) => Positioned(
                              left: index * 20,
                              child: const CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (hasVideoCall)
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.videocam_outlined),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}