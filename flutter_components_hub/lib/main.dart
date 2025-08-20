import 'package:flutter/material.dart';
import 'package:flutter_components_hub/Flutter_UI_Components/Main_Components/Skeleton_Loader/universal_loader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: UniversalSkeletonLoader(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SkeletonPlaceholder(width: 200.0, height: 24.0),
                  SizedBox(height: 16.0),
                  SkeletonPlaceholder(width: double.infinity, height: 16.0),
                  SizedBox(height: 8.0),
                  SkeletonPlaceholder(width: double.infinity, height: 16.0),
                  SizedBox(height: 8.0),
                  SkeletonPlaceholder(width: 150.0, height: 16.0),
                  SizedBox(height: 32.0),
                  Row(
                    children: <Widget>[
                      SkeletonPlaceholder(
                        width: 40.0,
                        height: 40.0,
                        borderRadius: 20.0,
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SkeletonPlaceholder(width: 120.0, height: 14.0),
                            SizedBox(height: 4.0),
                            SkeletonPlaceholder(width: 80.0, height: 10.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
