import 'package:omnisuite_front_end/modules/sign_in/data/models/sign_in_request_model.dart';
import 'package:omnisuite_front_end/modules/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:omnisuite_front_end/services/injectible.dart';
import 'package:omnisuite_front_end/utils/network/data_state.dart';

class SignInUseCase {
  Future<DataState<bool>> loginUser({SignInRequestModel? signInRequestModel}) async {
    return await serviceLocator.get<SignInRepository>().loginUser(
          signInRequestModel: signInRequestModel,
        );
  }
}
