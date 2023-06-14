import 'package:advanced_flutter_clean_architecture/data/data_source/remote_data_source.dart';
import 'package:advanced_flutter_clean_architecture/data/mapper/mapper.dart';
import 'package:advanced_flutter_clean_architecture/data/network/error_handler.dart';
import 'package:advanced_flutter_clean_architecture/data/network/failure.dart';
import 'package:advanced_flutter_clean_architecture/data/network/network_info.dart';
import 'package:advanced_flutter_clean_architecture/data/network/requests.dart';
import 'package:advanced_flutter_clean_architecture/domain/model/models.dart';
import 'package:advanced_flutter_clean_architecture/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet itd safe to call API
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          // success
          return Right(response.toDomain());
        } else {
          // failure
          return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ResponseMessage.DEFAULT));
        }
      } catch(error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
