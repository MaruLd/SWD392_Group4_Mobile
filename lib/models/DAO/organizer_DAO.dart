// import 'package:evsmart/models/DAO/base_DAO.dart';
// import 'package:dio/dio.dart';
// import 'package:evsmart/models/DTO/meta_data_dto.dart';
// import 'package:evsmart/models/DTO/organizers_model.dart';
// import 'package:evsmart/networking/api_request.dart';

// class OrganizerDAO extends BaseDAO {
//   Future<List<Organizer>> getAllOrganizer({
//     int page = 1,
//     int size = 50,
//     int? total,
//     Map<String, dynamic> params = const {},
//   }) async {
//     Response res;
//     res = await request.get(
//       'organizer',
//       queryParameters: {"page": page, "size": size}..addAll(params),
//     );
//     final organizers = Organizer.fromList(res.data["data"]);
//     metaDataDTO = MetaDataDTO.fromJson(res.data["metadata"]);
//     return organizers;
//   }
// }
