
import 'package:advanced_flutter_clean_architecture/app/app_prefs.dart';
import 'package:advanced_flutter_clean_architecture/data/data_source/remote_data_source.dart';
import 'package:advanced_flutter_clean_architecture/data/network/app_api.dart';
import 'package:advanced_flutter_clean_architecture/data/network/dio_factory.dart';
import 'package:advanced_flutter_clean_architecture/data/network/network_info.dart';
import 'package:advanced_flutter_clean_architecture/data/repository/repository_impl.dart';
import 'package:advanced_flutter_clean_architecture/domain/repository/repository.dart';
import 'package:advanced_flutter_clean_architecture/domain/usecase/forgot_password_usecase.dart';
import 'package:advanced_flutter_clean_architecture/domain/usecase/login_usecase.dart';
import 'package:advanced_flutter_clean_architecture/presentation/forgot_password/forgot_password_viewmodel.dart';
import 'package:advanced_flutter_clean_architecture/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();
  
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance<SharedPreferences>()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();

  // app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(instance<AppServiceClient>()));

  // repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance(), instance()));
}

initLoginModule() {
  if(!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initForgotPasswordModule() {
  if(!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordUseCase>(() => ForgotPasswordUseCase(instance()));
    instance.registerFactory<ForgotPasswordViewModel>(() => ForgotPasswordViewModel(instance()));
  }
}