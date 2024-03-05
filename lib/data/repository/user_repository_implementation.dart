import 'package:flutter_provider/core/service/network_service.dart';
import 'package:flutter_provider/data/entity/user.dart';
import 'package:flutter_provider/data/repository/user_repository.dart';

class UserRepositoryImplementation implements UserRepository{
  @override
  Future<List<User>?> getUsers() async {
    List<User>list = [];
    String? str = await NetworkService.GET(NetworkService.apiPosts, NetworkService.emptyParams());
    if(str != null){
      list = postModelFromJson(str);
      return list;
    }else{
      return null;
    }
  }

}