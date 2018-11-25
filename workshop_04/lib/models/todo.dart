import 'package:cloud_firestore/cloud_firestore.dart';

class TODO {
  final DocumentReference reference;
  String name;
  bool isDone;

  TODO(this.name, {this.isDone = false, this.reference});

  TODO.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['title'] != null),
        assert(map['isDone'] != null),
        name = map['title'],
        isDone = map['isDone'];

  TODO.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
