import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('todo app desu'),),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<Widget> _todoList = [];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textFieldController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      if(_textFieldController.text != ''){
                        _todoList.add(
                            TodoCard(todoString: _textFieldController.text)
                        );
                      }
                      _textFieldController.clear();
                    });
                  },
                  child: const Text('add task'),
                )
              )
            ],
          ),
        ),

        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: _todoList[index],
                onTap: () {
                  setState(() {
                    _todoList.removeRange(index, index+1);
                  });
                },
              );
            },
            itemCount: _todoList.length,
          )
        ),
      ],
    );
  }
}

class TodoCard extends StatelessWidget {
  const TodoCard({Key? key, required this.todoString}) : super(key: key);
  final String todoString;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8, left: 8, top: 4, bottom: 4),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(todoString),
        )
      ),
    );
  }
}
