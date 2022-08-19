import 'package:cocoroco/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/products_controller.dart';

class ProductsPage extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Productos'),
        ),
        body: SafeArea(
            child: Container(
          height: size.height,
          child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: 5,
              itemBuilder: ((context, index) => GestureDetector(
                    onTap: () => Get.toNamed(Routes.PRODUCT_DETAILS),
                    child: cardProductWidget(
                        'Gaseosa de 1Lt CocaCola', 3.00, false),
                  ))),
        )));
  }

  Widget cardProductWidget(String title, double price, bool hasTicket) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 125,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            Text('S/. $price'),
            const SizedBox(
              height: 5,
            ),
            hasTicketWidget(hasTicket)
          ],
        ),
      ),
    );
  }

  Widget hasTicketWidget(bool hasTicket) {
    return Container(
      decoration: BoxDecoration(
        color:
            hasTicket ? const Color.fromARGB(87, 255, 207, 84) : Colors.black12,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      padding: const EdgeInsets.all(4),
      child: hasTicket
          ? const Text('Con ticket')
          : const Text(
              'Sin ticket',
              style: TextStyle(color: Colors.grey),
            ),
    );
  }
}
