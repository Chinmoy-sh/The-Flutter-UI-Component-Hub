import 'package:flutter/material.dart';
import 'package:flutter_components_hub/Flutter_UI_Components/Main_Components/Skeleton_Loader/skeleton_loader_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Skeleton Loader Example')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SkeletonLoader(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SkeletonPlaceholder(
                        width: 50.0,
                        height: 50.0,
                        borderRadius: 25.0, // For a circular shape
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SkeletonPlaceholder(width: 150),
                            const SizedBox(height: 8),
                            SkeletonPlaceholder(),
                            const SizedBox(height: 8),
                            const SkeletonPlaceholder(width: 120),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
