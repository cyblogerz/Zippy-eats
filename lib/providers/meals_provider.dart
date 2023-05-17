import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zippy_eats/data/dummy_data.dart';

final mealsProvider = Provider(
  (ref) {
    return dummyMeals;
  },
);
