// import 'package:evsmart/models/DAO/category_DAO.dart';
// import 'package:evsmart/models/DTO/category_model.dart';
// import 'package:evsmart/screens/enums.dart';
// import 'package:evsmart/viewModel/baseModel.dart';

// class CategoryViewModel extends BaseModel {
//   CategoryDAO? categoryDAO;
//   List<Category>? listCategory;
//   CategoryViewModel() {
//     categoryDAO = CategoryDAO();
//   }

//   Future<void> getCategory() async {
//     try {
//       setState(ViewStatus.Loading);
//       listCategory = await categoryDAO?.getAllCategory();
//       await Future.delayed(Duration(microseconds: 500));
//       setState(ViewStatus.Completed);
//     } catch (e) {
//       listCategory = null;
//       setState(ViewStatus.Completed);
//     }
//   }
// }
