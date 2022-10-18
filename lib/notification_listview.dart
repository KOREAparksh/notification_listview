library notification_listview;

import 'dart:collection';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:notification_listview/notification_header.dart';
import 'package:notification_listview/notification_type.dart';

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
  }) : super(key: key);

  //Custom
  final List<T> elements;
  final NotiTileType Function(T element) groupBy;
  final Widget Function(BuildContext context, T element)? itemBuilder;
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
  final bool hasHeader;
  final VoidCallback? onTapSearch;
  final bool isSearching;

  @override
  State<NotificationListView<T>> createState() =>
      _NotificationListViewState<T>();
}

class _NotificationListViewState<T> extends State<NotificationListView<T>> {
  final List<T> _list = [];
  NotiTileType _selectedType = NotiTileType.all;

  @override
  void initState() {
    super.initState();
  }

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
