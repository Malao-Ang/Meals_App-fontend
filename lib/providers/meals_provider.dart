import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/dummay_data.dart';

final mealsProvider = Provider((ref) {
  return dummy_meal;
});
