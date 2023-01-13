import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SampleTodoPage extends StatelessWidget {
  const SampleTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supabase Flutter'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                FetchDataButton(),
                InsertDataButton(),
                UpdateDataButton(),
                DeleteDataButton(),
              ],
            ),
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
            final response = await supabase
                .from('todo')
                .select()
                .order('id', ascending: true);
            setState(() {
              fetchResult = response.toString();
            });
          },
        ),
        Text(fetchResult),
      ],
    );
  }
}

/// 新規データ追加
class InsertDataButton extends StatefulWidget {
  const InsertDataButton({super.key});

  @override
  State<InsertDataButton> createState() => _InsertDataButtonState();
}

class _InsertDataButtonState extends State<InsertDataButton> {
  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    return ElevatedButton(
      child: const Text('Insert Data'),
      onPressed: () async {
        // supabaseにデータを追加
        final response = await supabase.from('todo').insert([
          {'id': 2, 'name': 'test'},
        ]);
        print(response);
      },
    );
  }
}

/// データ更新ボタン
class UpdateDataButton extends StatelessWidget {
  const UpdateDataButton({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    return ElevatedButton(
      child: const Text('Update Data'),
      onPressed: () async {
        // supabaseのidが1のデータを更新
        final response =
            await supabase.from('todo').update({'name': 'テストデータ'}).eq('id', 1);
        print(response);
      },
    );
  }
}

/// データ削除ボタン
class DeleteDataButton extends StatelessWidget {
  const DeleteDataButton({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    return ElevatedButton(
      child: const Text('Delete Data'),
      onPressed: () async {
        // supabaseのidが2のデータを削除
        final response = await supabase.from('todo').delete().eq('id', 2);
        print(response);
      },
    );
  }
}
