import 'package:configuration/di/di_module.dart';

import 'package:shoppbee/data/grocery/repositories/user_repo.dart';

import '../../data/grocery/data_source/remote/user_api.dart';

class RepoModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory<UserRepoImpl>(
        () => UserRepoImpl(userApi: getIt.get<UserApi>()));
  }
}
