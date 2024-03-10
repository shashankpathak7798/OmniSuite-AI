import 'package:either_dart/either.dart';
import 'package:omnisuite_front_end/modules/text_model/data/model/request_model.dart';
import 'package:omnisuite_front_end/utils/error/failure.dart';

abstract class GenerateTextRepository {
  Future<Either<Failure, dynamic>> getResponse({
    required GenerateTextRequestModel body,
  });
}
