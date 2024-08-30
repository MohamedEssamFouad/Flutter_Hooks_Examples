import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Secondexample extends HookWidget {
  const Secondexample({super.key});

  @override
  Widget build(BuildContext context) {
    final numberController = useTextEditingController();
    final square = useState(0);


    void calculateSquare() {
      final number = int.tryParse(numberController.text) ?? 0;
      square.value = number * number;
    }

    useEffect(() {
      numberController.addListener(calculateSquare);
      return () => numberController.removeListener(calculateSquare);
    }, [numberController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Square Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter a number to calculate its square:'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: numberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number',
                ),
              ),
            ),
            Text('Square of number: ${square.value}'),
          ],
        ),
      ),
    );
  }
}
