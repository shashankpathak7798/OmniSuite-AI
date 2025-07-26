import 'package:either_dart/either.dart';
import 'package:omnisuite_front_end/modules/text_model/data/model/request_model.dart';
import 'package:omnisuite_front_end/modules/text_model/domain/repository/generate_text_repository.dart';
import 'package:omnisuite_front_end/utils/error/failure.dart';
import 'package:omnisuite_front_end/utils/network/api_provider.dart';

class GenerateTextRepositoryImpl extends GenerateTextRepository {
  final _apiProvider = ApiProvider();
  @override
  Future<Either<Failure, dynamic>> getResponse({
    required GenerateTextRequestModel body,
  }) async {
    final response = await _apiProvider.getData(
      subUrl: "/generate-response",
      baseUrl: "http://localhost:3000",
      body: body.toJson(),
    );

    if (response == null) {
      return Left(ServerFailure(message: "No reponse from server"));
    } else {
      return Right(response);
    }
  }
}
