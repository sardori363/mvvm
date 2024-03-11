import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_provider/data/entity/user.dart';
import 'package:flutter_provider/data/repository/user_repository_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var homeRef = ChangeNotifierProvider.autoDispose<HomeNotifier>((ref) => HomeNotifier());

class HomeNotifier with ChangeNotifier{
  List<User> users = [];
  bool isLoading = false;
  UserRepositoryImplementation appRepositoryImplementation = UserRepositoryImplementation();


  Future<void>getAllUsers()async{
    isLoading = false;
    users = await appRepositoryImplementation.getUsers() ?? [];
    isLoading = true;
  } 

  HomeNotifier(){
    log("message");
    getAllUsers();
  }

}