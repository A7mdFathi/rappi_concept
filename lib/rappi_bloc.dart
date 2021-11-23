import 'package:flutter/material.dart';
import 'package:flutter_tabbar_listview/rappi_data.dart';

class RappiBLoc with ChangeNotifier {
  List<RappiTabCategory> tabs = [];
  TabController tabController;

  void init(TickerProvider ticker) {
    tabController = TabController(length: rappiCategorties.length, vsync: ticker);

    for (int i = 0; i < rappiCategorties.length; i++) {
      final category = rappiCategorties[i];
      tabs.add(RappiTabCategory(category: category, selected: (i == 0)));
    }
  }
}

class RappiTabCategory {
  const RappiTabCategory({
    @required this.category,
    @required this.selected,
  });

  final RappiCategory category;
  final bool selected;
}
