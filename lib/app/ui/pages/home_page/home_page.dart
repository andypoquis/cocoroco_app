import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 250, 251, 1),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              headerWidget(),
              cardEventWidget(size),
            ]),
      ),
    );
  }

  Widget headerWidget() {
    return Expanded(
        flex: 3,
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                informationPerfilWidget(),
                const SizedBox(
                  height: 15,
                ),
                searchWidget(),
              ],
            )));
  }

  Widget informationPerfilWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            'assets/profile.jpg',
            fit: BoxFit.fill,
            height: 50,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bienvenido!! 👋',
              style: TextStyle(color: Colors.black45),
            ),
            Obx(() => Text(
                  controller.uname.value == '' ? '' : controller.uname.value,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: Color(0xff474747)),
                )),
          ],
        ),
        Expanded(child: Container()),
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        IconButton(
            onPressed: () => controller.logout(),
            icon: const Icon(Icons.logout))
      ],
    );
  }

  Widget searchWidget() {
    return const TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          prefixIcon: Icon(Icons.search),
          hintText: 'Buscar'),
    );
  }

  Widget cardEventWidget(final size) {
    return Expanded(
      flex: 9,
      child: Padding(
          padding: const EdgeInsets.all(15),
          child: Obx(
            () => ListView.builder(
                itemCount: controller.events.length,
                itemBuilder: ((context, index) => Column(
                      children: [
                        GestureDetector(
                          onTap: () => controller.naviationEventPage(index),
                          child: Card(
                            color: const Color.fromRGBO(255, 197, 52, 1),
                            child: SizedBox(
                              width: size.width,
                              height: 80,
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                          Text(
                                            '18',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    50, 47, 46, 1),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20),
                                          ),
                                          Text('Agosto',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    194, 74, 73, 74),
                                                fontWeight: FontWeight.w400,
                                              ))
                                        ])),
                                    Expanded(
                                        flex: 3,
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          color: const Color.fromRGBO(
                                              249, 248, 249, 1),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Hero(
                                                    tag: 'title',
                                                    child: Text(
                                                      controller.events[index]
                                                          .description
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: Color.fromRGBO(
                                                              50, 47, 46, 1),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16),
                                                    )),
                                                Text(
                                                  controller.events[index].place
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.black45,
                                                  ),
                                                ),
                                              ]),
                                        )),
                                  ]),
                            ),
                          ),
                        )
                      ],
                    ))),
          )),
    );
  }
}
