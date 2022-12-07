import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String DocumentId;

  GetUserName({required this.DocumentId});

  @override
  Widget build(BuildContext context) {
    //get the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(DocumentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('Name : ${data['name']}');
        }
        return Text('Loading...');
      },
    );
  }
}

class GetUserEmail extends StatelessWidget {
  final String DocumentId;

  GetUserEmail({required this.DocumentId});

  @override
  Widget build(BuildContext context) {
    //get the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(DocumentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('email : ${data['email']}');
        }
        return Text('Loading...');
      },
    );
  }
}
