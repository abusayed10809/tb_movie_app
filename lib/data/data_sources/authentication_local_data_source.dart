import 'package:hive/hive.dart';
import 'package:tb_movie_app/common/constants/hive_constants.dart';

abstract class AuthenticationLocalDataSource{
  Future<void> saveSessionId(String sessionId);
}

class AuthenticationLocalDataSourceImpl extends AuthenticationLocalDataSource{
  @override
  Future<void> saveSessionId(String sessionId) async{
    final Box authenticationBox = await Hive.openBox(HiveConstants.authenticationBox);
    await authenticationBox.put(HiveConstants.sessionIdKey, sessionId);
  }

}