import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://bspacnznobnlkwjcwgtl.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJzcGFjbnpub2JubGt3amN3Z3RsIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI3NTYwNjgsImV4cCI6MTk4ODMzMjA2OH0.tjcZ8KhCWAr8-bRgCiotZyYBGcCMG1AAN_ZjM8gSuRA',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Supabase Flutter'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              FetchDataButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class FetchDataButton extends StatefulWidget {
  const FetchDataButton({super.key});

  @override
  State<FetchDataButton> createState() => _FetchDataButtonState();
}

class _FetchDataButtonState extends State<FetchDataButton> {
  // SQL取得結果
  String fetchResult = '';

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    return Column(
      children: [
        ElevatedButton(
          child: const Text('Fetch Data'),
          onPressed: () async {
            // supabaseからデータを取得
            final response = await supabase.from('todo').select();
            setState(() {
              fetchResult = response[0].toString();
            });
          },
        ),
        Text(fetchResult),
      ],
    );
  }
}
