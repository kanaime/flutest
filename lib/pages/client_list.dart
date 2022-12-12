import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutest/commons/app_drawer.dart';
import 'package:flutest/read_data/get_user_name.dart';
import 'package:flutter/material.dart';

import '../commons/appBar.dart';

class ListingClient extends StatelessWidget {
  const ListingClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: myAppBar("List Client", context),
      ),
      drawer: myDrawer(context),
      body: const ClientList(),
    );
  }
}

class ClientList extends StatefulWidget {
  const ClientList({super.key});

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  // Doc Ids
  List<String> docIDs = [];

  // Get doc Ids
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((Snapshot) => Snapshot.docs.forEach((element) {
              print(element.reference);
              docIDs.add(element.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDocId(),
      builder: ((context, snapshot) {
        return ListView.builder(
          itemCount: docIDs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text('toto'),
                subtitle: Text('toto'),
                tileColor: Colors.grey,
              ),
            );
          },
        );
      }),
    );
  }
}
