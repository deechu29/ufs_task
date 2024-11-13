import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ufs_task/controller/home_screen_controller.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(
      {super.key,
      required String img,
      required String id,
      required String des,
      required String price});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<HomeScreenController>().detailproducts();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Detail Screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image(image: NetworkImage("")),
              height: 400,
              width: 400,
              color: Colors.amber,
            ),
            Text(
              "bag",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              "price:500",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "des",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
