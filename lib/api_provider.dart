import 'package:book_api_using_provide/services.dart';
import 'package:flutter/foundation.dart';

import 'model.dart';

class Api_Provider  extends ChangeNotifier {
  final PizzaService _service = PizzaService();
  bool isLoading = false;
  List<Recipes>? _contDetails;

  List<Recipes>? get contDetail => _contDetails;

  Future<void> getAllDetails() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getRecipe();
    _contDetails = response;

    isLoading = false;
    notifyListeners();
  }
}