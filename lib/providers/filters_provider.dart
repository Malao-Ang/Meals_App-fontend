import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:meals_app/filter.dart';
enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FlutterNotifier extends StateNotifier<Map<Filter, bool>> {
  FlutterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });
  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    // state[filter] = isActive;
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FlutterNotifier, Map<Filter, bool>>(
        (ref) => FlutterNotifier());
