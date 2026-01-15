import 'package:omnisuite_front_end/modules/sign_in/data/models/sign_in_request_model.dart';
import 'package:omnisuite_front_end/utils/network/data_state.dart';

abstract class SignInRepository {
  Future<DataState<bool>> loginUser({SignInRequestModel? signInRequestModel});
}