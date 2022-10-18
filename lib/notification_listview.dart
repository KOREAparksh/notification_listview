library notification_listview;

import 'dart:collection';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:notification_listview/notification_header.dart';
import 'package:notification_listview/notification_type.dart';

///This [NotificationListView] is optimized for the notification type used in the Hyundai Auto Ever project.
///
///Same as listview.builder except for itembuilder and header related properties.
///
///No comments are left except for custom values and properties.
///
///See [ListView.builder].
///
///These comments refer to [GroupedListView].

@immutable
class NotificationListView<T> extends StatefulWidget {
  const NotificationListView({
    Key? key,
    required this.elements,
    required this.groupBy,
    required this.hasHeader,
    this.itemBuilder,
    this.indexItemBuilder,
    this.reverse = false,
    this.controller,
    this.primary,
    this.scrollPhysics = const BouncingScrollPhysics(),
    this.shrinkWrap = false,
    this.padding = const EdgeInsets.only(left: 20, right: 20),
    this.itemExtent,
    this.prototypeItem,
    this.itemCount,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.onTapSearch,
    this.isSearching = false,
  })  : assert(itemBuilder != null || indexItemBuilder != null),
        super(key: key);

  //Custom

  ///Full list of items.
  final List<T> elements;

  ///This function is for checking the type of each item.
  final NotiTileType Function(T element) groupBy;

  ///If this value is false, the header is not displayed.
  final bool hasHeader;

  ///If this value is null, the Search button is not visible.
  final VoidCallback? onTapSearch;

  ///If this value is true, the Search button's color changes.
  final bool isSearching;

  ///Call to build children for this list with
  ///0 <= element < element.length
  final Widget Function(BuildContext context, T element)? itemBuilder;

  ///Call to build children for this list with
  ///0 <= element < element.length
  final Widget Function(BuildContext context, T element, int index)?
      indexItemBuilder;

  // default
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics scrollPhysics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;
  final double? itemExtent;
  final Widget? prototypeItem;
  final int? itemCount;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;

  @override
  State<NotificationListView<T>> createState() =>
      _NotificationListViewState<T>();
}

class _NotificationListViewState<T> extends State<NotificationListView<T>> {
  ///It is a list that extracts and stores the values actually shown in elements.
  final List<T> _list = [];

  ///This is the currently selected type.
  NotiTileType _selectedType = NotiTileType.all;

  @override
  void initState() {
    super.initState();
  }

  ///This method extracts and stores only the values to be used in the element.
  void setList() {
    _list.clear();

    if (_selectedType == NotiTileType.all) {
      _list.addAll(widget.elements);
    } else {
      for (var element in widget.elements) {
        if (widget.groupBy(element) == _selectedType) {
          _list.add(element);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    setList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        NotiListHeader(
          onTapSearch: widget.onTapSearch,
          isSearching: widget.isSearching,
          selectedType: _selectedType,
          onTapAll: () {
            _selectedType = NotiTileType.all;
            setState(() {});
          },
          onTapAlert: () {
            _selectedType = NotiTileType.alert;
            setState(() {});
          },
          onTapChatting: () {
            _selectedType = NotiTileType.chatting;
            setState(() {});
          },
          onTapNormal: () {
            _selectedType = NotiTileType.normal;
            setState(() {});
          },
        ),
        Expanded(
          child: ListView.builder(
            key: widget.key,
            reverse: widget.reverse,
            controller: widget.controller,
            primary: widget.primary,
            physics: widget.scrollPhysics,
            shrinkWrap: widget.shrinkWrap,
            padding: widget.padding,
            prototypeItem: widget.prototypeItem,
            itemExtent: widget.itemExtent,
            itemCount: _list.length,
            addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
            addRepaintBoundaries: widget.addRepaintBoundaries,
            addSemanticIndexes: widget.addSemanticIndexes,
            cacheExtent: widget.cacheExtent,
            semanticChildCount: widget.semanticChildCount,
            dragStartBehavior: widget.dragStartBehavior,
            keyboardDismissBehavior: widget.keyboardDismissBehavior,
            restorationId: widget.restorationId,
            clipBehavior: widget.clipBehavior,
            itemBuilder: itemBuilder,
          ),
        ),
      ],
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final value = _list[index];
    return (widget.indexItemBuilder != null)
        ? widget.indexItemBuilder!(context, value, index)
        : widget.itemBuilder!(context, value);
  }
}
