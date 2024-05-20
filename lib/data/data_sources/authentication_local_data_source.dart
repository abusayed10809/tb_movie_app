import 'package:hive/hive.dart';
import 'package:tb_movie_app/common/constants/hive_constants.dart';
import 'package:tb_movie_app/common/helpers/helper_functions.dart';

abstract class AuthenticationLocalDataSource{
  Future<void> saveSessionId(String sessionId);
  Future<String> getSessionId();
  Future<void> deleteSessionId();
}

class AuthenticationLocalDataSourceImpl extends AuthenticationLocalDataSource{
  @override
  Future<void> saveSessionId(String sessionId) async{
    final Box authenticationBox = await Hive.openBox(HiveConstants.authenticationBox);
    await authenticationBox.put(HiveConstants.sessionIdKey, sessionId);
  }

  @override
  Future<void> deleteSessionId() async{
    logMessage('delete session local');
    final Box authenticationBox = await Hive.openBox(HiveConstants.authenticationBox);
    authenticationBox.delete(HiveConstants.sessionIdKey);
  }

  @override
  Future<String> getSessionId() async{
    final Box authenticationBox = await Hive.openBox(HiveConstants.authenticationBox);
    return await authenticationBox.get(HiveConstants.sessionIdKey);
  }

}