import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocoroco/app/controllers/general_controller.dart';
import 'package:cocoroco/app/data/models/user_model.dart';
import 'package:cocoroco/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/models/event_model.dart';

class HomeController extends GetxController {
  final _controllerGeneral = Get.put(GeneralController());

  RxString uid = "".obs;
  RxString uname = ''.obs;
  GetStorage box = GetStorage();

  RxList<Event> events = <Event>[].obs;
  RxList<UserModel> users = <UserModel>[].obs;

  RxString idEvent = ''.obs;

  @override
  void onInit() async {
    await GetStorage.init('uid');
    uid.value = (box.read('uid') == null) ? '' : box.read('uid');

    await _users();
    events.bindStream(listEvents());
    super.onInit();
  }

  Stream<List<Event>> listEvents() {
    // Stream<QuerySnapshot> stream = FirebaseFirestore.instance
    //     .collection('event')
    //     .where('userId', isEqualTo: uid.value)
    //     .snapshots();

    Stream<QuerySnapshot> stream =
        FirebaseFirestore.instance.collection('event').snapshots();

    return stream.map((qevent) => qevent.docs
        .map((e) => Event(
              id: e.id,
              description: e['description'],
              place: e['place'],
              reference: e['reference'],
              status: e['status'],
              ticketPrice: e['ticketPrice'],
              totalTickets: e['totalTickets'],
              userId: e['userId'],
            ))
        .toList());
  }

  void logout() async {
    box.remove('uid');
    box.write('success', false);
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.SIGN_IN);
  }

  _users() {
    Stream<DocumentSnapshot> stream = FirebaseFirestore.instance
        .collection('user')
        .doc(uid.value)
        .snapshots();

    stream.listen((event) {
      uname.value = event.get('name');
      update();
    });
  }

  printEvent() => print(events.length);

  naviationEventPage(int index) {
    _controllerGeneral.idEvent.value = events[index].id;
    Get.toNamed(Routes.EVENT);
  }
}
