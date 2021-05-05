import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  WordPair editWordPair;

  EditPage(this.editWordPair);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController _newPairController = TextEditingController();

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  void initState() {
    super.initState();
    _newPairController.text =
        '${capitalize(widget.editWordPair.first)} ${capitalize(widget.editWordPair.second)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EditPage")),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Edite a palavra"),
              TextFormField(
                controller: _newPairController,
                keyboardType: TextInputType.text,
              ),
              ElevatedButton(
                  onPressed: () {
                    List<String> newValues =
                        _newPairController.value.text.split(' ');
                    if (newValues.length == 2) {
                      final newWordPairs =
                          new WordPair(newValues[0], newValues[1]);
                      Navigator.pop(context, newWordPairs);
                    }
                  },
                  child: Text("Confirmar"))
            ],
          ),
        ),
      ),
    );
  }
}
