import 'package:get_it/get_it.dart';
import 'package:omnisuite_front_end/config/router/app_router.dart';
import 'package:omnisuite_front_end/modules/text_model/data/repositories/generate_text_repository_impl.dart';
import 'package:omnisuite_front_end/modules/text_model/domain/repository/generate_text_repository.dart';
import 'package:omnisuite_front_end/modules/text_model/domain/usecase/generate_text_use_case.dart';
import 'package:omnisuite_front_end/modules/text_model/presentation/bloc/text_generation_bloc.dart';

final locator = GetIt.instance;

void initializeDependencies() {
  locator.registerSingleton<AppRouter>(
    AppRouter(),
  );

  locator.registerFactory<TextGenerationBloc>(
    () => TextGenerationBloc(),
  );

  locator.registerSingleton<GenerateTextRepository>(
    GenerateTextRepositoryImpl(),
  );
  locator.registerLazySingleton<GenerateTextUseCase>(
    () => GenerateTextUseCase(),
  );
}
