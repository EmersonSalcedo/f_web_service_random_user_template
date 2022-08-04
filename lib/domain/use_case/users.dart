import 'package:get/get.dart';

import '../../data/models/random_user_model.dart';
import '../entities/random_user.dart';
import '../repositories/user_repository.dart';

class Users {
  UserRepository userRepository = Get.find();
  Future<void> addUser() async => await userRepository.getUser();
  Future<List<RandomUser>> getAllUsers() async =>
      await userRepository.getAllUsers();
  Future<void> deleteUser(id) async => await userRepository.deleteUser(id);
  Future<void> deleteAll() async => await userRepository.deleteAll();
  Future<void> updateUser(user) async => await userRepository.updateUser(user);
}
