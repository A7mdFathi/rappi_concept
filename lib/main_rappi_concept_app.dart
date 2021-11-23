import 'package:flutter/material.dart';
import 'package:flutter_tabbar_listview/rappi_bloc.dart';

const _backgroundColor = Color(0xfff6f9fa);
const _blueColor = Color(0xff0d1863);
const _greenColor = Color(0xff2bbeba);
const categoryHeight = 55.0;
const productHeight = 100.0;

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              height: 90,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                controller: _bloc.tabController,
                isScrollable: true,
                indicatorWeight: 0.1,
                tabs: _bloc.tabs.map((e) => _RappiTabWidget(tabCategory:  e)).toList(),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    if (index.isOdd) {
                      return _RappiCategoryItem();
                    } else {
                      return _RappiProductItem();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
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
    final selected=tabCategory.selected;
    return  Opacity(
      opacity: selected?1:0.5,
      child: Card(
        elevation:selected? 6:0,
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
  const _RappiCategoryItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: categoryHeight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: const Text(
        'Category',
        style: TextStyle(
          color: _blueColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _RappiProductItem extends StatelessWidget {
  const _RappiProductItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: productHeight,
      child: Text('product'),
    );
  }
}
