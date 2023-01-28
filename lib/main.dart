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
            leading: Container(),
            title: Text('Tasks'),
          ),
          body: ListView(
            children: [
              Task('Leard Flutter','https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large'),
              Task('Ride a bike','https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg'),
              Task('Read','https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg'),
            ],
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {}),
        ));
  }
}

class Task extends StatefulWidget {
  final String name;
  final String image;

  const Task(this.name,this.image, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;

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
            Column(
              children: [
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
                            child: Image.network(
                                widget.image,
                            fit: BoxFit.cover,)
                        ),
                        Container(
                          // To constrain the size of the text
                          width: 200,
                          child: Text(
                            widget.name,
                            style: TextStyle(fontSize: 24),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          height: 52,
                          width: 52,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  level++;
                                });
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Icon(Icons.arrow_drop_up),
                                  Text(
                                    'UP',
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              )),
                        )
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: level / 10,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Level: $level',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
