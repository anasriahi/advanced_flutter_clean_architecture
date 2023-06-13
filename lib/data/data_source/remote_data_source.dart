import 'package:advanced_flutter_clean_architecture/data/network/app_api.dart';
import 'package:advanced_flutter_clean_architecture/data/network/requests.dart';
import 'package:advanced_flutter_clean_architecture/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password
    );
  }

}