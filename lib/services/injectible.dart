import 'package:get_it/get_it.dart';
import 'package:omnisuite_front_end/modules/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:omnisuite_front_end/modules/pdf_analyzer/presentation/bloc/pdf_analyzer_bloc.dart';
import 'package:omnisuite_front_end/modules/sign_in/data/repositories/sign_in_repository_impl.dart';
import 'package:omnisuite_front_end/modules/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:omnisuite_front_end/modules/sign_in/domain/usecases/sign_in_use_case.dart';
import 'package:omnisuite_front_end/modules/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:omnisuite_front_end/modules/splash/presentation/bloc/splash_bloc.dart';
import 'package:omnisuite_front_end/modules/text_model/data/repositories/generate_text_repository_impl.dart';
import 'package:omnisuite_front_end/modules/text_model/domain/repository/generate_text_repository.dart';
import 'package:omnisuite_front_end/modules/text_model/domain/usecase/generate_text_use_case.dart';
import 'package:omnisuite_front_end/modules/text_model/presentation/bloc/text_generation_bloc.dart';
import 'package:omnisuite_front_end/services/shared_preferences/local_storage.dart';
import 'package:omnisuite_front_end/utils/network/api_provider.dart';

final serviceLocator = GetIt.instance;

void initializeDependencies() {
  serviceLocator.registerLazySingleton<ApiProvider>(() => ApiProvider());
  serviceLocator.registerLazySingleton<LocalStorage>(() => LocalStorage());
  serviceLocator.registerFactory<TextGenerationBloc>(
    () => TextGenerationBloc(),
  );

  serviceLocator.registerSingleton<GenerateTextRepository>(
    GenerateTextRepositoryImpl(),
  );
  serviceLocator.registerLazySingleton<GenerateTextUseCase>(
    () => GenerateTextUseCase(),
  );

  serviceLocator.registerFactory<SplashBloc>(() => SplashBloc());

  /// [SIGN IN]
  serviceLocator.registerFactory<SignInBloc>(() => SignInBloc());
  serviceLocator.registerLazySingleton<SignInRepository>(() => SignInRepositoryImpl());
  serviceLocator.registerLazySingleton<SignInUseCase>(() => SignInUseCase());

  /// [DASHBOARD]
  serviceLocator.registerFactory<DashboardBloc>(() => DashboardBloc());

  /// [PDF ANALYZER]
  serviceLocator.registerFactory<PdfAnalyzerBloc>(() => PdfAnalyzerBloc());
}
