import 'package:omnisuite_front_end/modules/sign_in/data/models/sign_in_request_model.dart';
import 'package:omnisuite_front_end/modules/sign_in/data/models/sign_in_response_model.dart';
import 'package:omnisuite_front_end/modules/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:omnisuite_front_end/services/injectible.dart';
import 'package:omnisuite_front_end/services/shared_preferences/local_storage.dart';
import 'package:omnisuite_front_end/utils/api_url_endpoints.dart';
import 'package:omnisuite_front_end/utils/network/api_provider.dart';
import 'package:omnisuite_front_end/utils/network/data_error.dart';
import 'package:omnisuite_front_end/utils/network/data_state.dart';
import 'package:omnisuite_front_end/utils/network/log.dart';

class SignInRepositoryImpl extends SignInRepository {
  final _apiProvider = serviceLocator<ApiProvider>();

  @override
  Future<DataState<bool>> loginUser({SignInRequestModel? signInRequestModel}) async {
    try {
      final response = await _apiProvider.getData(
        subUrl: ApiUrlEndpoints.loginUser, body: signInRequestModel?.toJson(),);

      if (response == null) {
        Log.info("[INFO] Failed to login user! No response received from server!");
        return DataFailure(DataError());
      }

      final model = SignInResponseModel.fromJson(response);

      if (model.accessToken == null) {
        return DataFailure(DataError());
      }

      await serviceLocator<LocalStorage>().setString(model.accessToken ?? '', localStorageKey: LocalStorageKey.accessToken);
      await serviceLocator<LocalStorage>().setString(model.refreshToken ?? '', localStorageKey: LocalStorageKey.refreshToken);
      await serviceLocator<LocalStorage>().setString(model.userId ?? '', localStorageKey: LocalStorageKey.loggedInUserId);
      await serviceLocator<LocalStorage>().setString(model.emailId ?? '', localStorageKey: LocalStorageKey.loggedInEmailId);

      return const DataSuccess(true);
    } catch (e, st) {
      Log.error("[ERROR] Caught Exception in SignInRepositoryImpl: $e", e);
      return DataFailure(DataError());
    }
  }
}