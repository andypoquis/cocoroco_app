import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoroco/app/data/models/product_model.dart';
import 'package:get/get.dart';

class GeneralController extends GetxController {
  RxString idEvent = "".obs;

  Stream<List<Product>> listEvents() {
    // Stream<QuerySnapshot> stream = FirebaseFirestore.instance
    //     .collection('event')
    //     .where('userId', isEqualTo: uid.value)
    //     .snapshots();

    Stream<QuerySnapshot> stream =
        FirebaseFirestore.instance.collection('event').snapshots();

    return stream.map((qevent) => qevent.docs.map((e) => Product()).toList());
  }
}
