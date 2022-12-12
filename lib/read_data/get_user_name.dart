import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String DocumentId;
  final style;

  GetUserName({required this.DocumentId, this.style});

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
          return Text('${data['name']}', style: style);
        }
        return Text('Loading...');
      },
    );
  }
}

class GetUserEmail extends StatelessWidget {
  final String DocumentId;
  final style;

  GetUserEmail({required this.DocumentId, this.style});

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
          return Text('${data['email']}', style: style);
        }
        return Text('Loading...');
      },
    );
  }
}

class GetUserId extends StatelessWidget {
  final String DocumentId;

  GetUserId({required this.DocumentId});

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
          return Text('${data['id']}');
        }
        return Text('Loading...');
      },
    );
  }
}
