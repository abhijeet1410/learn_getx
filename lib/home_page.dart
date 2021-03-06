import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'change_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ChangeImageController _changeImageController;

  @override
  void initState() {
    super.initState();
    _changeImageController = Get.isRegistered<ChangeImageController>()
        ? Get.find<ChangeImageController>()
        : Get.put(ChangeImageController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: const Text("Pictures"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Obx(() {
              return Image.asset(_changeImageController.count.value == 1
                  ? "assets/feather.jpg"
                  : _changeImageController.count.value == 2
                      ? "assets/tree.jpg"
                      : "assets/winter.jpg");
            }),
            // Obx(() => Image.asset(_changeImageController.count.value == 1
            //     ? "assets/feather.jpg"
            //     : _changeImageController.count.value == 2
            //         ? "assets/winter.jpg"
            //         : "assets/tree.jpg")),
            const Expanded(child: SizedBox()),
            Row(children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.grey[800]),
                  child: const Text("Previous"),
                  onPressed: () {
                    _changeImageController.previousVal();
                  },
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey[800]),
                child: const Text("Go to next"),
                onPressed: _changeImageController.navigate,
              ))
            ])
          ],
        ),
      ),
    );
  }
}
