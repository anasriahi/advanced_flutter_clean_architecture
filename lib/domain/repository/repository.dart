import 'package:dartz/dartz.dart';
import 'package:advanced_flutter_clean_architecture/data/network/failure.dart';
import 'package:advanced_flutter_clean_architecture/data/network/requests.dart';
import 'package:advanced_flutter_clean_architecture/domain/model/models.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}