import 'package:flutter/material.dart';
import 'package:flutter_provider/core/service/network_service.dart';
import 'package:flutter_provider/data/entity/user.dart';

class DetailsPage extends StatelessWidget {
  static const String id = "details_page_id/";
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                User newUser = User(
                    firstName: nameController.text,
                    age: int.parse(ageController.text),
                    email: emailController.text,
                    bloodGroup: "default",
                    gender: "default",
                    height: 170,
                    lastName: "default",
                    maidenName: "default",
                    password: "default",
                    phone: "default",
                    username: "default",
                    weight: 70.1);
                await NetworkService.POST(
                    NetworkService.apiPosts, newUser.toJson());
                Navigator.pop(context);
              },
              icon: const Icon(Icons.done_outline),
            )
          ],
        ),
        body: Column(children: [
          Expanded(
            flex: 2,
            child: TextField(
              controller: nameController,
              maxLength: 25,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  hintText: "Name",
                  hintStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
          Expanded(
            flex: 2,
            child: TextField(
              controller: emailController,
              maxLines: 50,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  hintText: "Email",
                  hintStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
          Expanded(
            flex: 2,
            child: TextField(
              controller: ageController,
              maxLines: 50,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  hintText: "Age",
                  hintStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
        ]));
  }
}
