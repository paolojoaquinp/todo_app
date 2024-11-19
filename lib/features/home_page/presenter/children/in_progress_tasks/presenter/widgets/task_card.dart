import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int memberCount;
  final bool showImage;

  const TaskCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.memberCount,
    this.showImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 2, color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            if (showImage) ...[
              const SizedBox(height: 8),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Icon(Icons.image),
                ),
              ),
            ],
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Aquí está la corrección principal
                SizedBox(
                  // height: 24,
                  child: Row(
                    children: List.generate(
                      memberCount,
                      (index) => Padding(
                        padding: EdgeInsets.only(left: 2.0),
                        child: Container(
                          decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                            border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.grey[(index + 1) * 100],
                              child: Text(
                                String.fromCharCode(65 + index),
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      color: Colors.amber[100],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.paperclip,
                        size: 14,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        '$memberCount',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
