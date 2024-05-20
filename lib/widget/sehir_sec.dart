import 'package:flutter/material.dart';

class SehirSec extends StatefulWidget {
  const SehirSec({super.key});

  @override
  State<SehirSec> createState() => _SehirSecState();
}

class _SehirSecState extends State<SehirSec> {
  final TextEditingController _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Şehir Seç'),
      ),
      body: Form(
        key: _formKey,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _textController,
                  decoration: const InputDecoration(
                      labelText: 'Şehir',
                      hintText: 'Şehir Seçin',
                      border: OutlineInputBorder()),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context, _textController.text);
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
