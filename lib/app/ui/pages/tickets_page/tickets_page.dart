import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/tickets_controller.dart';

class TicketsPage extends GetView<TicketsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tickets'),
      ),
      body: SafeArea(
        child: ListView(children: []),
      ),
    );
  }
}
