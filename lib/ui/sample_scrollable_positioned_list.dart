import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

const numberOfItems = 5001;
const minItemHeight = 20.0;
const maxItemHeight = 150.0;
const scrollDuration = Duration(seconds: 2);

const randomMax = 1 << 32;

class SampleScrollablePositionedListPage extends StatefulWidget {
  const SampleScrollablePositionedListPage({Key? key}) : super(key: key);

  @override
  State<SampleScrollablePositionedListPage> createState() => _SampleScrollablePositionedListPageState();
}

class _SampleScrollablePositionedListPageState extends State<SampleScrollablePositionedListPage> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController = ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  late List<double> itemHeights;
  late List<Color> itemColors;
  bool reversed = false;
  double alignment = 0;

  @override
  void initState() {
    super.initState();
    final heightGenerator = Random(238902348);
    final colorGenerator = Random(42490823);
    itemHeights = List<double>.generate(numberOfItems, (index) => heightGenerator.nextDouble() * (maxItemHeight - minItemHeight) + minItemHeight);
    itemColors = List<Color>.generate(numberOfItems, (index) => Color(colorGenerator.nextInt(randomMax)).withOpacity(1));

  }

  @override
  Widget build(BuildContext context) => Material(
    child: Scaffold(
      appBar: AppBar(title: Text("TITLE"),),
      body: OrientationBuilder(
        builder: (context, orientation) => Column(
          children: <Widget>[
             Expanded(child: list(orientation)),
            positionsView,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  children: <Widget>[
                     scrollControlButtons,
                     scrollOffsetControlButtons,
                     const SizedBox(height:10),
                    jumpControlButtons,
                    alignmentControl,
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ),
  );

  Widget get scrollControlButtons => Row(
    children: <Widget>[
      const Text('scroll to'),
      scrollItemButton(0),
      scrollItemButton(5),
      scrollItemButton(10),
      scrollItemButton(100),
      scrollItemButton(1000),
      //scrollItemButton(5000),
    ],
  );
  Widget get jumpControlButtons => Row(
    children: <Widget>[
      const Text('jump to'),
      jumpButton(0),
      jumpButton(5),
      jumpButton(10),
      jumpButton(100),
      jumpButton(1000),
      //jumpButton(5000),
    ],
  );
  Widget get scrollOffsetControlButtons => Row(
    children: <Widget>[
      const Text('scroll by'),
      scrollOffsetButton(-1000),
      scrollOffsetButton(-100),
      scrollOffsetButton(-10),
      scrollOffsetButton(10),
      scrollOffsetButton(100),
      scrollOffsetButton(1000),
    ],
  );

  Widget get alignmentControl => Row(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      const Text('Alignment:'),
      SizedBox(
        width:200,
        child: SliderTheme(
          data: SliderThemeData(
            showValueIndicator: ShowValueIndicator.always,
          ),
              child: Slider(
                value: alignment,
                label: alignment.toStringAsFixed(2),
                onChanged: (double value) => setState(() => alignment = value ),
              )
        ),
      )
    ],
  );
  Widget list(Orientation orientation) => ScrollablePositionedList.builder(
      itemCount: numberOfItems,
      itemBuilder: (context, index) => item(index, orientation),
    itemScrollController: itemScrollController,
    itemPositionsListener: itemPositionsListener,
    scrollOffsetController: scrollOffsetController,
    reverse: reversed,
    scrollDirection: orientation == Orientation.portrait ? Axis.vertical: Axis.horizontal,
  );
  Widget get positionsView => ValueListenableBuilder<Iterable<ItemPosition>>(
    valueListenable: itemPositionsListener.itemPositions,
    builder: (context, positions, child) {
      int? min;
      int? max;
      if (positions.isNotEmpty) {
        // Determine the first visible item by finding the item with the
        // smallest trailing edge that is greater than 0.  i.e. the first
        // item whose trailing edge in visible in the viewport.
        min = positions
            .where((ItemPosition position) => position.itemTrailingEdge > 0)
            .reduce((ItemPosition min, ItemPosition position) =>
        position.itemTrailingEdge < min.itemTrailingEdge
            ? position
            : min)
            .index;
        // Determine the last visible item by finding the item with the
        // greatest leading edge that is less than 1.  i.e. the last
        // item whose leading edge in visible in the viewport.
        max = positions
            .where((ItemPosition position) => position.itemLeadingEdge < 1)
            .reduce((ItemPosition max, ItemPosition position) =>
        position.itemLeadingEdge > max.itemLeadingEdge
            ? position
            : max)
            .index;
      }
      return Row(
        children: <Widget>[
          Expanded(child: Text('First Item: ${min ?? ''}')),
          Expanded(child: Text('Last Item: ${max ?? ''}')),
          const Text('Reversed: '),
          Checkbox(
              value: reversed,
              onChanged: (bool? value) => setState(() {
                reversed = value!;
              }))
        ],
      );
    },
  );



  ButtonStyle _scrollButtonStyle({required double horizonalPadding}) =>
      ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: horizonalPadding, vertical: 0),
        ),
        minimumSize: MaterialStateProperty.all(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );
  Widget scrollItemButton(int value) => TextButton(
    key: ValueKey<String>('Scroll$value'),
    onPressed: () => scrollTo(value),
    child: Text('$value'),
    style: _scrollButtonStyle(horizonalPadding: 20),
  );
  Widget scrollOffsetButton(int value) => TextButton(
    key: ValueKey<String>('Scroll$value'),
    onPressed: () => scrollBy(value.toDouble()),
    child: Text('$value'),
    style: _scrollButtonStyle(horizonalPadding: 10),
  );
  Widget jumpButton(int value) => TextButton(
    key: ValueKey<String>('Jump$value'),
    onPressed: () => jumpTo(value),
    child: Text('$value'),
    style: _scrollButtonStyle(horizonalPadding: 20),
  );

  void scrollBy(double offset) => scrollOffsetController.animateScroll(
      offset: offset, duration: scrollDuration, curve: Curves.easeInOutCubic);

  void scrollTo(int index) => itemScrollController.scrollTo(
      index: index,
      duration: scrollDuration,
      curve: Curves.easeInOutCubic,
      alignment: alignment);

  void jumpTo(int index) =>
      itemScrollController.jumpTo(index: index, alignment: alignment);



  Widget item(int i , Orientation orientation) {
    return SizedBox(
      height: orientation == Orientation.portrait ? itemHeights[i] : null,
      width:  Orientation == Orientation.landscape ? itemHeights[i]: null,
      child: Container(
        color: itemColors[i],
        child: Center(
          child: Text('Item $i'),
        ),
      ),
    );
  }
}
