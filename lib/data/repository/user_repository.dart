import 'package:flutter_provider/data/entity/user.dart';

abstract class UserRepository{
  Future<List<User>?> getUsers();
}