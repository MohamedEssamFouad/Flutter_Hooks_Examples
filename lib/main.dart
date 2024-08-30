import 'package:flutter/material.dart';

import 'FlutterHookss/Example.dart';
import 'FlutterHookss/ThirdExample.dart';
import 'FlutterHookss/secondExample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

          home: ThirdExample(),
        );
  }
}
