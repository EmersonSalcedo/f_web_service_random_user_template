import 'package:loggy/loggy.dart';

import '../../data/datasources/local/user_local_datasource.dart';
import '../../data/datasources/remote/user_remote_datasource.dart';
import '../../data/models/random_user_model.dart';
import '../entities/random_user.dart';

class UserRepository {
  late UserRemoteDatatasource userRemoteDatatasource;
  late UserLocalDataSource userLocalDataSource;
  UserRepository() {
    logInfo("Starting UserRepository");
    userRemoteDatatasource = UserRemoteDatatasource();
    userLocalDataSource = UserLocalDataSource();
  }

  Future<bool> getUser() async {
    RandomUser randomUser = await userRemoteDatatasource.getUser();
    await userLocalDataSource.addUser(randomUser);
    return Future.value(true);
  }

  Future<List<RandomUser>> getAllUsers() async {
    return userLocalDataSource.getAllUsers();
  }

  Future<void> deleteUser(id) async {
    await userLocalDataSource.deleteUser(id);
  }

  Future<void> deleteAll() async {
    await userLocalDataSource.deleteAll();
  }

  Future<void> updateUser(user) async {
    await userLocalDataSource.updateUser(user);
  }
}
