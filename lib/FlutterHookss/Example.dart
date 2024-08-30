import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Example extends HookWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    final counter=useState(0);

    return  Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          TextButton(onPressed: (){
            counter.value++;
          },
              child: Text('add state ${counter.value}')
          ),
          TextButton(onPressed: (){
            counter.value--;
          },
              child: Text('add state ${counter.value}')
          ),
        ],
      ),

    );
  }
}
