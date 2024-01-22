import 'package:advanced_flutter_clean_architecture/data/network/failure.dart';
import 'package:advanced_flutter_clean_architecture/domain/repository/repository.dart';
import 'package:advanced_flutter_clean_architecture/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class ForgotPasswordUseCase extends BaseUseCase<String, String> {
  final Repository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(String input) async {
    return await _repository.forgotPassword(input);
  }
}