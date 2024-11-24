import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DatabaseQueryPage(),
    );
  }
}

class DatabaseQueryPage extends StatefulWidget {
  const DatabaseQueryPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DatabaseQueryPageState createState() => _DatabaseQueryPageState();
}

class _DatabaseQueryPageState extends State<DatabaseQueryPage> {
  List<String> _data = [];
  bool _isLoading = false;

  // Simulating a database query with Future.delayed
  Future<void> _fetchDataFromDatabase() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate a delay to mimic fetching data from a database
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _data = [
          'Database Item 1',
          'Database Item 2',
          'Database Item 3',
          'Database Item 4',
          'Database Item 5',
        ];
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulated Database Fetch'),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator() // Show loading indicator while fetching
            : _data.isEmpty
                ? ElevatedButton(
                    onPressed: _fetchDataFromDatabase,
                    child: const Text('Fetch Data'),
                  )
                : ListView.builder(
                    itemCount: _data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_data[index]),
                      );
                    },
                  ),
      ),
    );
  }
}
