import 'package:evsmart/models/DAO/organizer_DAO.dart';
import 'package:evsmart/models/DTO/organizers_model.dart';
import 'package:evsmart/viewModel/baseModel.dart';

import '../screens/enums.dart';

class OrganizerViewModel extends BaseModel {
  OrganizerDAO? organizerDAO;
  List<Organizer>? listOrganizer;
  CategoryViewModel() {
    organizerDAO = OrganizerDAO();
  }

  Future<void> getCategory() async {
    try {
      setState(ViewStatus.Loading);
      listOrganizer = await organizerDAO?.getAllOrganizer();
      await Future.delayed(Duration(microseconds: 500));
      setState(ViewStatus.Completed);
    } catch (e) {
      listOrganizer = null;
      setState(ViewStatus.Completed);
    }
  }
}
