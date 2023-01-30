import 'package:flutter/material.dart';
import 'package:task_force/components/task.dart';
import 'package:task_force/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tasks'),
      ),
      body: ListView(
        children: const [
          Task(
              'Learn Flutter',
              'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
              3),
          Task(
              'Ride a bike',
              'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg',
              4),
          Task(
              'Read',
              'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
              3),
          SizedBox(height: 80)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FormScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
