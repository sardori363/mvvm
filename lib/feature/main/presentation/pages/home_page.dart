import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/core/service/network_service.dart';
import 'package:flutter_provider/feature/main/view_model/main_vm.dart';
import 'package:flutter_provider/main.dart';

import 'details_page.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page_id/";
  static bool day = false;

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MainVM mainVM = MainVM();
  final remoteConfig = FirebaseRemoteConfig.instance;

  @override
  void initState() {
    initialConfig();
    mainVM.getAllUsers().then((value) {
      setState(() {});
    });
    log("initState");
    remoteConfig.onConfigUpdated.listen((event) async {
      await remoteConfig.activate();
      setState(() {});
    });
    super.initState();
  }

  Future<void> fetchData() async {
    await remoteConfig.fetchAndActivate().then((value) {
      HomePage.day = remoteConfig.getBool("appbar_day");
    });
  }

  Future<void> initialConfig() async {
    remoteConfig.setDefaults({
      "appbar_day": HomePage.day,
    });
    await fetchData();
    remoteConfig.onConfigUpdated.listen((event) async {
      await fetchData();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: HomePage.day ? Colors.black : Colors.white,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        backgroundColor: HomePage.day ? Colors.white : Colors.black,
        elevation: 0,
        title: Center(
          child: Text(
            "Recent users",
            style: TextStyle(color: HomePage.day ? Colors.black : Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.pushNamed(context, DetailsPage.id);
              mainVM.getAllUsers().then((value) {
                setState(() {});
              });
            },
            icon: Icon(
              Icons.add,
              color: HomePage.day ? Colors.black : Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        itemCount: mainVM.users.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onLongPress: () async {
              await NetworkService.DELETE(NetworkService.apiPosts, mainVM.users[index].id!);
              setState(() {
                
              });
            },
            onTap: () {
              /// navigating to details
            },
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 10,
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          mainVM.users[index].firstName ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          mainVM.users[index].username ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
