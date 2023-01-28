import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Tasks'),
          ),
          body: ListView(
            children: [
              Task('Leard Flutter'),
              Task('Ride a bike'),
              Task('Meditate'),
              Task('Meditate'),
              Task('Meditate'),
              Task('Meditate'),
              Task('Meditate'),
              Task('Meditate'),
              Task('Meditate'),
              Task('Meditate'),
              Task('Meditate'),
              Task('Meditate'),
              Task('Meditate'),
              Task('Meditate'),
              Task('Meditate'),
              Task('Meditate'),
              Task('Meditate'),
              Task('Meditate'),
              Task('Meditate'),
            ],
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {}),
        ));
  }
}

class Task extends StatelessWidget {
  final String name;

  const Task(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 140,
            ),
            Container(
                color: Colors.white,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.black26,
                      width: 72,
                      height: 100,
                    ),
                    Container( // To constrain the size of the text
                      width: 200,
                      child: Text(
                        name,
                        style: TextStyle(fontSize: 24),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: Icon(Icons.arrow_drop_up))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
