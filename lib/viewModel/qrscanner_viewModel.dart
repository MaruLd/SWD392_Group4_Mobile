import 'package:evsmart/models/DAO/qrcodescanner_DAO.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:evsmart/viewModel/base_viewModel.dart';

import '../models/DTO/TicketUseCodeResult.dart';

class QRScannerViewModel extends BaseModel {
  Future<TicketUseCodeResult?> getScannerResult(String ticketId, String code) async {
    try {
      return await QRScannerDAO?.useCode(code: code, ticketId: ticketId);
    } catch (e) {
      return null;
    }
  }
}
