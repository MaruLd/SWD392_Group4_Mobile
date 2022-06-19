import 'package:evsmart/models/category_model.dart';
import 'package:evsmart/models/event_model.dart';
import 'package:evsmart/networking/api_provider.dart';

class CategoryRepository {
  ApiProvider _provider = ApiProvider();

  Future<Category> fetchCategoryData() async {
    final response = await _provider.get("api/v1/event-category");
    return Category.fromJson(response);
  }
}
