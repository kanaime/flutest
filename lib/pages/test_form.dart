import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutest/commons/constant.dart';
import '../main.dart';
import 'package:flutest/commons/appBar.dart';
import 'package:flutest/commons/app_drawer.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final formKey = GlobalKey<FormState>();
  final titlesController = TextEditingController();
  final descriptionController = TextEditingController();
  final userController = TextEditingController();

  @override
  void dispose() {
    titlesController.dispose();
    descriptionController.dispose();
    userController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: myAppBar("Register", context),
      ),
      drawer: myDrawer(context),
      body: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: titlesController,
                  decoration: textInputDecoration.copyWith(hintText: 'Titles'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: descriptionController,
                    decoration:
                        textInputDecoration.copyWith(hintText: 'description'),
                    keyboardType: TextInputType.multiline,
                    minLines: 3,
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: userController,
                    decoration:
                        textInputDecoration.copyWith(hintText: 'username'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  )),
              const SizedBox(height: 8.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final titles = titlesController.text;
                      final description = descriptionController.text;
                      final username = userController.text;

                      Future createTest(
                          {required String name,
                          required String description,
                          required String titles}) async {
                        final docTest =
                            FirebaseFirestore.instance.collection('test');

                        final json = {
                          'titles': titles,
                          'description': description,
                          'username': name,
                        };
                        await docTest.add(json);
                      }

                      createTest(
                          titles: titles,
                          description: description,
                          name: username);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('formulaire envoyer'),
                        ),
                      );

                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => const MyApp()),
                      );
                    }
                    /*
                    const AlertDialog(title: Text('Hellow'));
                  */
                  },
                  child: const Text('save'),
                ),
              ),
            ],
          )),
    );
  }
}
