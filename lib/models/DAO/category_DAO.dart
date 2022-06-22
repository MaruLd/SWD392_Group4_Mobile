// import 'package:dio/dio.dart';
// import 'package:evsmart/models/DAO/base_DAO.dart';
// import 'package:evsmart/models/DTO/category_model.dart';
// import 'package:evsmart/models/DTO/meta_data_dto.dart';
// import 'package:evsmart/networking/api_request.dart';

// class CategoryDAO extends BaseDAO {
//   Future<List<Category>> getAllCategory({
//     int page = 1,
//     int size = 50,
//     int? total,
//     Map<String, dynamic> params = const {},
//   }) async {
//     Response res;
//     res = await request.get(
//       'event-category',
//       queryParameters: {"page": page, "size": size}..addAll(params),
//     );
//     final categories = Category.fromList(res.data);
//     // metaDataDTO = MetaDataDTO.fromJson(res.data["metadata"]);
//     return categories;
//   }
// }
