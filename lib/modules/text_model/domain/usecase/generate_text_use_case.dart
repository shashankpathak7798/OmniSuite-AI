import 'package:either_dart/either.dart';
import 'package:omnisuite_front_end/modules/text_model/data/model/request_model.dart';
import 'package:omnisuite_front_end/modules/text_model/domain/repository/generate_text_repository.dart';
import 'package:omnisuite_front_end/services/locator.dart';
import 'package:omnisuite_front_end/utils/error/failure.dart';
import 'package:omnisuite_front_end/utils/usecase/use_case.dart';

class GenerateTextUseCase
    implements UseCaseOneInput<GenerateTextRequestModel, dynamic> {
  @override
  Future<Either<Failure, dynamic>> invoke(body) async {
    return await locator.get<GenerateTextRepository>().getResponse(
          body: body,
        );
  }
}
