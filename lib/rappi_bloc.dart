import 'package:flutter/material.dart';
import 'package:flutter_tabbar_listview/rappi_data.dart';

class RappiBLoc with ChangeNotifier {
  List<RappiTabCategory> tabs = [];
  TabController tabController;

  void init(TickerProvider ticker) {
    tabController =
        TabController(length: rappiCategorties.length, vsync: ticker);

    for (int i = 0; i < rappiCategorties.length; i++) {
      final category = rappiCategorties[i];
      tabs.add(RappiTabCategory(category: category, selected: (i == 0)));
    }
  }

  void onCategorySelected(int index) {
    final selected = tabs[index];
    for (int i = 0; i < tabs.length; i++) {
      tabs[i] = tabs[i].copyWith(selected.category.name == tabs[i].category.name);
    }
    notifyListeners();
  }
}

class RappiTabCategory {
  const RappiTabCategory({
    @required this.category,
    @required this.selected,
  });
  RappiTabCategory copyWith(bool selected) => RappiTabCategory(
        category: category,
        selected: selected,
      );
  final RappiCategory category;
  final bool selected;
}
