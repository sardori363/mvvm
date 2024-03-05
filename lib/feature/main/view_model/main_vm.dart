import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_provider/data/entity/user.dart';
import 'package:flutter_provider/data/repository/user_repository_implementation.dart';

class MainVM with ChangeNotifier{
  List<User> users = [];
  bool isLoading = false;
  UserRepositoryImplementation appRepositoryImplementation = UserRepositoryImplementation();


  Future<void>getAllUsers()async{
    isLoading = false;
    users = await appRepositoryImplementation.getUsers() ?? [];
    isLoading = true;
  }

  MainVM(){
    log("message");
    getAllUsers();
  }

}