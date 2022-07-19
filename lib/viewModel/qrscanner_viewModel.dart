import 'package:evsmart/models/DAO/qrcodescanner_DAO.dart';
import 'package:evsmart/screens/enums.dart';
import 'package:evsmart/viewModel/base_viewModel.dart';

class QRScannerViewModel extends BaseModel {
  Future<String?> getScannerResult(String ticketId, String code) async {
    try {
      return await QRScannerDAO?.useCode(code: code, ticketId: ticketId);
    } catch (e) {
      return null;
    }
  }
}
