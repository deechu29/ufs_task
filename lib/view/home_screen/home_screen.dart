import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ufs_task/controller/home_screen_controller.dart';
import 'package:ufs_task/view/home_screen/detail_screen/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get index => null;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<HomeScreenController>().fetchproducts();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              scrollControlDisabledMaxHeightRatio:
                  NavigationToolbar.kMiddleSpacing,
              useSafeArea: true,
              context: context,
              builder: (context) => Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Title",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "price",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "discription",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "categories",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                            onTap: () {},
                            child: Container(
                                child: Center(child: Text("Add")),
                                color: Colors.blue,
                                height: 50,
                                width: 100))
                      ],
                    ),
                  ),
                ),
                height: 500,
                width: double.infinity,
              ),
            );
          },
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Home screen",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Consumer<HomeScreenController>(
          builder: (context, provider, child) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(
                            img: provider.plist[index].image ?? "",
                            id: provider.plist[index].id.toString(),
                            des: provider.plist[index].description ?? "",
                            price: provider.plist[index].price.toString())));
              },
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Image(
                                image: NetworkImage(
                                    provider.plist[index].image ?? "")),
                          ),
                          title: Text(provider.plist[index].title ?? ""),
                          subtitle: Text(
                              "price:${provider.plist[index].price.toString()}"),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                            ),
                            style: ButtonStyle(
                                iconColor: WidgetStatePropertyAll(Colors.red)),
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: provider.plist.length),
            );
          },
        ));
  }
}
