import 'package:flutter/material.dart';
import 'package:flutter_tabbar_listview/rappi_bloc.dart';
import 'package:flutter_tabbar_listview/rappi_data.dart';

const _backgroundColor = Color(0xfff6f9fa);
const _blueColor = Color(0xff0d1863);
const _greenColor = Color(0xff2bbeba);

class MainRappiConceptApp extends StatelessWidget {
  const MainRappiConceptApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: _RappiConcept(),
    );
  }
}

class _RappiConcept extends StatefulWidget {
  const _RappiConcept({Key key}) : super(key: key);

  @override
  State<_RappiConcept> createState() => _RappiConceptState();
}

class _RappiConceptState extends State<_RappiConcept>
    with SingleTickerProviderStateMixin {
  final _bloc = RappiBLoc();
  @override
  void initState() {
    _bloc.init(this);
    super.initState();
  }


  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: AnimatedBuilder(
            animation: _bloc,
            builder: (_, __) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(

                    height: 80,
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 15.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Homepage',
                            style: TextStyle(
                                color: _blueColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          CircleAvatar(
                            backgroundColor: _greenColor,
                            radius: 17,
                            child: ClipOval(
                              child: Image.asset(
                                'assets/placeholder.png',
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    child: TabBar(
                      onTap: _bloc.onCategorySelected,
                      controller: _bloc.tabController,
                      isScrollable: true,
                      indicatorWeight: 0.1,
                      tabs: _bloc.tabs
                          .map((e) => _RappiTabWidget(tabCategory: e))
                          .toList(),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: _bloc.scrollController,
                      itemCount: _bloc.items.length,
                      itemBuilder: (context, index) {
                        final item = _bloc.items[index];
                        if (item.isCategory) {
                          return _RappiCategoryItem(category: item.category);
                        } else {
                          return _RappiProductItem(product: item.product);
                        }
                      },
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class _RappiTabWidget extends StatelessWidget {
  const _RappiTabWidget({
    Key key,
    @required this.tabCategory,
  }) : super(key: key);
  final RappiTabCategory tabCategory;
  @override
  Widget build(BuildContext context) {
    final selected = tabCategory.selected;
    return Opacity(
      opacity: selected ? 1 : 0.5,
      child: Card(
        elevation: selected ? 6 : 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            tabCategory.category.name,
            style: const TextStyle(
              color: _blueColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}

class _RappiCategoryItem extends StatelessWidget {
  const _RappiCategoryItem({
    Key key,
    @required this.category,
  }) : super(key: key);
  final RappiCategory category;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: categoryHeight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: Card(
        child: Text(
          category.name,
          style: const TextStyle(
            color: _blueColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _RappiProductItem extends StatelessWidget {
  const _RappiProductItem({
    Key key,
    @required this.product,
  }) : super(key: key);
  final RappiProduct product;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: productHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Card(
          elevation: 6,
          shadowColor: Colors.black54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(product.image),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        color: _blueColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      product.description,
                      maxLines: 2,
                      style: const TextStyle(
                        color: _blueColor,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: _greenColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
