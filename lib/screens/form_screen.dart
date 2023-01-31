import 'package:flutter/material.dart';
import 'package:task_force/components/task.dart';
import 'package:task_force/data/task_dao.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidator(String? value) {
    if ((value != null &&
        (value.isEmpty || int.parse(value) > 5 || int.parse(value) < 1))) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Task'),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Container(
              constraints: const BoxConstraints(
                  minHeight: 650, maxHeight: double.infinity),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Enter with the task name';
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Name',
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: difficultyController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (difficultyValidator(value)) {
                          return 'The difficulty must be between 1 and 5';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Difficulty',
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (text) {
                        setState(() {});
                      },
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.url,
                      validator: (value) {
                        if (valueValidator(value)) {
                          return 'Enter the image URL!';
                        }
                        return null;
                      },
                      controller: imageController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Image',
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.blue)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(imageController.text, errorBuilder:
                          (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                        return Image.asset('assets/images/nophoto.png');
                      }, fit: BoxFit.cover),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {

                          TaskDao().saveOrUpdate(Task(
                              nameController.text,
                              imageController.text,
                              int.parse(difficultyController.text)));

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Creating new Task')));
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Add !'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
