import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
class MyhomePage extends StatefulWidget {
  const MyhomePage({super.key});

  @override
  State<MyhomePage> createState() => _PathProviderPartOneState();
}

class _PathProviderPartOneState extends State<MyhomePage> {
  String documentsPath = '';
  String tempPath = '';

  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    setState(() {
      documentsPath = docDir.path;
      tempPath = tempDir.path;
    });
  }

  @override
  void initState() {
    super.initState();
    getPaths();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Path Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Doc path: $documentsPath'),
          Text('Temp path: $tempPath')
        ],
      ),
    );
  }
}
