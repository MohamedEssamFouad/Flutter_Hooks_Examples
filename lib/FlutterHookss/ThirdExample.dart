import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ThirdExample extends HookWidget {
  const ThirdExample({super.key});

  @override
  Widget build(BuildContext context) {
    final jokeFuture = useState<Future<String>?>(null);
    useEffect(() {
      jokeFuture.value = fetchJoke();
      return;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Joke'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: jokeFuture.value == null
                  ? const CircularProgressIndicator()
                  : FutureBuilder<String>(
                future: jokeFuture.value,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text('Joke: ${snapshot.data}');
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                jokeFuture.value = fetchJoke();
              },
              child: const Text('Another Joke'),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> fetchJoke() async {
    final response = await http.get(
      Uri.parse('https://icanhazdadjoke.com/'),
      headers: {'Accept': 'application/json'},
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['joke'];
    } else {
      throw Exception('Failed to load joke');
    }
  }
}
