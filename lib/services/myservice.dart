import 'package:firebase_database/firebase_database.dart';

class MyService {
  Future<bool> updateWater(bool value) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref("kendali");
      await ref.update({
        "air": value,
      });
      return value;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateKipas(bool value) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref("kendali");
      await ref.update({
        "kipas": value,
      });
      return value;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateKapur(bool value) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref("kendali");
      await ref.update({
        "kapur": value,
      });
      return value;
    } catch (e) {
      rethrow;
    }
  }
}
