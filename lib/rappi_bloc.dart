import 'package:flutter/material.dart';
import 'package:flutter_tabbar_listview/rappi_data.dart';

const categoryHeight = 55.0;
const productHeight = 110.0;

class RappiBLoc with ChangeNotifier {
  List<RappiTabCategory> tabs = [];
  List<RappiItem> items = [];
  TabController tabController;
  ScrollController scrollController = ScrollController();
  void init(TickerProvider ticker) {
    tabController =
        TabController(length: rappiCategorties.length, vsync: ticker);
    double offsetFrom = 0.0;
    for (int i = 0; i < rappiCategorties.length; i++) {
      final category = rappiCategorties[i];

      if (i > 0) {
        offsetFrom += rappiCategorties[i - 1].products.length * productHeight;
      }

      tabs.add(RappiTabCategory(
        category: category,
        selected: (i == 0),
        offsetFrom: categoryHeight * i + offsetFrom,
      ));

      items.add(RappiItem(category: category));
      for (int j = 0; j < category.products.length; j++) {
        final product = category.products[j];
        items.add(RappiItem(product: product));
      }
    }
  }

  void onCategorySelected(int index) {
    final selected = tabs[index];
    for (int i = 0; i < tabs.length; i++) {
      tabs[i] =
          tabs[i].copyWith(selected.category.name == tabs[i].category.name);
    }
    notifyListeners();

    scrollController.animateTo(
      selected.offsetFrom,
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceOut,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }
}

class RappiTabCategory {
  const RappiTabCategory({
    @required this.category,
    @required this.selected,
    @required this.offsetFrom,
  });

  RappiTabCategory copyWith(bool selected) => RappiTabCategory(
        category: category,
        selected: selected,
        offsetFrom: offsetFrom,
      );
  final RappiCategory category;
  final bool selected;
  final double offsetFrom;
}

class RappiItem {
  const RappiItem({
    this.category,
    this.product,
  });

  final RappiCategory category;
  final RappiProduct product;
  bool get isCategory => category != null;
}
