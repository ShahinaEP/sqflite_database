
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/product_controller.dart';
import '../database/database_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key ? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoading = false;
  final ProductController _controller = Get.put(ProductController());
  @override
  void initState() {
    // _loadFromApi();
    _loadFromProfileApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqflife Page'),
        // backgroundColor: Colors.brown,
        centerTitle: true,

      ),
      body: isLoading
          ? Center(
             child: CircularProgressIndicator(),
      )
          : buildProductData(),
    );
  }

  _loadFromApi() async {
    DbHelper().getProductdata();
    final  apiProvider = Get.put(ProductController());
    await apiProvider.getData();
  }

  _loadFromProfileApi() async {
    DbHelper().getProfiledata();
    final  apiProvider = Get.put(ProductController());
    await apiProvider.getProfileData();
  }

  _deleteData() async {
    setState(() {
      isLoading = true;
    });

    await DbHelper().deleteAllEmployees();

    // wait for 1 second to simulate loading of data
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isLoading = false;
    });

    print('All employees deleted');
  }

  buildProductData() {
    return Container(
      child: Text(DbHelper().getProfiledata().toString()),
    );
      // FutureBuilder(
      //   future: DbHelper().getProfiledata(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (!snapshot.hasData) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else {
      //       return ListView.builder(
      //
      //         itemCount: 1,
      //         itemBuilder: (BuildContext context, int index) {
      //           return ListTile(
      //             leading: Text(
      //               "${index + 1}",
      //               style: TextStyle(fontSize: 20.0),
      //             ),
      //             title: Text(
      //                 "Name: ${snapshot}"),
      //           );
      //         },
      //       );
      //     }
      //   },
      // );
  }
}