import 'package:baity_app/categories/views/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoriesPageWrapper extends StatefulWidget {
  const CategoriesPageWrapper({super.key});

  @override
  State<CategoriesPageWrapper> createState() => _CategoriesPageWrapperState();
}

class _CategoriesPageWrapperState extends State<CategoriesPageWrapper> {

  late ScrollController _firstController;
  late ScrollController _secondController;

  bool _isSyncingFirst = false;
  bool _isSyncingSecond = false;

  final List<double> _firstItemHeights = [];
  final List<double> _secondItemHeights = [];

  @override
  void initState() {
    super.initState();
    _firstController = ScrollController();
    _secondController = ScrollController();

    // Simulated item heights
    _firstItemHeights.addAll(List.generate(50, (index) => 50.0 + (index % 5) * 10));
    _secondItemHeights.addAll(List.generate(50, (index) => 60.0 + (index % 3) * 15));

    _firstController.addListener(() {
      if (_isSyncingSecond) return;
      _syncSecondToFirst();
    });

    _secondController.addListener(() {
      if (_isSyncingFirst) return;
      _syncFirstToSecond();
    });
  }

  void _syncSecondToFirst() async{
    if( _isSyncingFirst == false ) {
      _isSyncingFirst = true;
      int currentIndex = _getIndexFromOffset(_firstController.offset, _firstItemHeights);
      double targetOffset = _getOffsetFromIndex(currentIndex, _secondItemHeights);
      await _secondController.animateTo(targetOffset, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      _isSyncingFirst = false;
    }
  }

  void _syncFirstToSecond() async {
    if( _isSyncingSecond == false ) {
      _isSyncingSecond = true;
      int currentIndex = _getIndexFromOffset(_secondController.offset, _secondItemHeights);
      double targetOffset = _getOffsetFromIndex(currentIndex, _firstItemHeights);
      await _firstController.animateTo(targetOffset, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      _isSyncingSecond = false;
    }
  }

  int _getIndexFromOffset(double offset, List<double> itemHeights) {
    double cumulativeHeight = 0.0;
    for (int i = 0; i < itemHeights.length; i++) {
      cumulativeHeight += itemHeights[i];
      if (offset < cumulativeHeight) {
        return i;
      }
    }
    return itemHeights.length - 1;
  }

  double _getOffsetFromIndex(int index, List<double> itemHeights) {
    return itemHeights.sublist(0, index).fold(0.0, (sum, height) => sum + height);
  }

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
        backgroundColor: const Color(0xffeeeeee),
      ),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ListView.builder(
                controller: _firstController,
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: const Text('Category Name'),
                    onTap: () {},
                  );
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ListView.builder(
                controller: _secondController,
                addAutomaticKeepAlives: true,
                itemCount: 100,
                itemBuilder: (context, index) => CategoryCard(index: index),
              ),
            ),
          ],
        ),
      )
    );
  }
}