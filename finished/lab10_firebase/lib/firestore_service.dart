import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lab10/sport.dart';

class FirestoreService {
  final CollectionReference _teamCollection =
  FirebaseFirestore.instance.collection('teams');

  Future<void> addTeam(FootballTeam team) {
    return _teamCollection.add(team.toMap());
  }

  Future<List<FootballTeam>> getTeams() async {
    QuerySnapshot snapshot = await _teamCollection.get();
    return snapshot.docs.map((doc) {
      return FootballTeam(
        teamName: doc.get('teamName'),
        teamSize: doc.get('teamSize'),
        region: doc.get('region'),
      );
    }).toList();
  }

}