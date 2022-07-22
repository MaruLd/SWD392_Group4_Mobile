import 'package:evsmart/models/DAO/auth_DAO.dart';
import 'package:evsmart/models/DTO/auth_model.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:evsmart/utils/shared_pref.dart';

import 'base_viewModel.dart';

class AccountViewModel extends BaseModel {
  AuthDTO? currentUser;
  AuthDAO? dao;

  AccountViewModel() {
    dao = AuthDAO();
  }

  Future<void> fetchUser({bool isRefetch = false}) async {
    try {
      if (isRefetch) {
        setState(ViewStatus.Refreshing);
      } else if (status != ViewStatus.Loading) {
        setState(ViewStatus.Loading);
      }

      final user = await dao?.getUser();
      currentUser = user;

      String? token = await getToken();
      print(token.toString());

      setState(ViewStatus.Completed);
    } catch (e, stacktrace) {
      print(e.toString() + stacktrace.toString());
    }
  }
}
