import 'package:cocoroco/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/event_controller.dart';

class EventPage extends GetView<EventController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Hero(
                tag: 'title',
                child: Text(
                  'Gran parrillada bailable',
                  style: TextStyle(
                      color: Color.fromRGBO(50, 47, 46, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                )),
            centerTitle: true,
            expandedHeight: 150,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  color: Color(0xFFFFCE54),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(75),
                      bottomRight: Radius.circular(75))),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              )
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                spacing: 20,
                children: [
                  cardOptionsWidget('assets/tickets.png', 'Tickets', 0),
                  cardOptionsWidget('assets/products.png', 'Productos', 1),
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }

  Widget cardOptionsWidget(String pathImage, String title, int page) {
    return GestureDetector(
      onTap: () {
        switch (page) {
          case 0:
            Get.toNamed(Routes.TICKETS);
            break;
          case 1:
            Get.toNamed(Routes.PRODUCTS);
            break;
          default:
        }
      },
      child: Card(
        color: const Color(0xffF8F8F8),
        child: SizedBox(
          height: 145,
          width: 155,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              pathImage,
              height: 75,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(title,
                style: const TextStyle(
                  color: Color.fromRGBO(50, 47, 46, 1),
                  fontWeight: FontWeight.w600,
                ))
          ]),
        ),
      ),
    );
  }
}
