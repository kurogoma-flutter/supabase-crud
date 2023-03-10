import 'package:flutter/material.dart';
import 'package:supabase_crud/sample_todo_page.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supabase Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _CustomButton(
                    onTap: () {
                      // SampleTodoPageに遷移
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SampleTodoPage(),
                        ),
                      );
                    },
                    label: 'サンプル Todo Page',
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

class _CustomButton extends StatelessWidget {
  const _CustomButton({
    Key? key,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  final void Function() onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        child: Text(label),
      ),
    );
  }
}
