// import 'dart:async';

// import 'package:evsmart/models/category_model.dart';
// import 'package:evsmart/networking/api_response.dart';
// import 'package:evsmart/repository/category_repository.dart';

// import 'bloc.dart';

// class CategoryBloc implements Bloc {
//   CategoryRepository _categoryRepository;
//   StreamController _categoryListController;

//   StreamSink<Response<Category>> get categoryListSink =>
//       _categoryListController.sink;

//   Stream<Response<Category>> get categoryListStream =>
//       _categoryListController.stream;

//   CategoryBloc() {
//     _categoryListController = StreamController<Response<Category>>();
//     _categoryRepository = CategoryRepository();
//     fetchCategories();
//   }

//   fetchCategories() async {
//     categoryListSink.add(Response.loading("Getting Chuck Categories."));
//     try {
//       Category chuckCats = await _categoryRepository.fetchCategoryData();
//       categoryListSink.add(Response.completed(chuckCats));
//     } catch (e) {
//       categoryListSink.add(Response.error(e.toString()));
//       print(e);
//     }
//   }

//   @override
//   dispose() {
//     _categoryListController.close();
//   }
// }
