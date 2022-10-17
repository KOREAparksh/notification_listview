library notification_listview;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:notification_listview/notification_header.dart';
import 'package:notification_listview/notification_type.dart';

class NotiListView extends StatelessWidget {
  const NotiListView({
    Key? key,
    required this.hasHeader,
    required this.itemBuilder,
    required this.onTapAll,
    required this.onTapAlert,
    required this.onTapNormal,
    required this.onTapChatting,
    required this.selectedType,
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
  final Widget Function(BuildContext, int) itemBuilder;
  final bool hasHeader;
  final VoidCallback? onTapSearch;
  final bool isSearching;

  final VoidCallback onTapAll;
  final VoidCallback onTapAlert;
  final VoidCallback onTapNormal;
  final VoidCallback onTapChatting;
  final NotiTileType? selectedType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        NotiListHeader(
          onTapSearch: onTapSearch,
          isSearching: isSearching,
          onTapAll: onTapAll,
          onTapAlert: onTapAlert,
          onTapNormal: onTapNormal,
          onTapChatting: onTapChatting,
          selectedType: selectedType,
        ),
        Expanded(
          child: ListView.builder(
            key: key,
            reverse: reverse,
            controller: controller,
            primary: primary,
            physics: scrollPhysics,
            shrinkWrap: shrinkWrap,
            padding: padding,
            prototypeItem: prototypeItem,
            itemExtent: itemExtent,
            itemCount: itemCount,
            addAutomaticKeepAlives: addAutomaticKeepAlives,
            addRepaintBoundaries: addRepaintBoundaries,
            addSemanticIndexes: addSemanticIndexes,
            cacheExtent: cacheExtent,
            semanticChildCount: semanticChildCount,
            dragStartBehavior: dragStartBehavior,
            keyboardDismissBehavior: keyboardDismissBehavior,
            restorationId: restorationId,
            clipBehavior: clipBehavior,
            itemBuilder: itemBuilder,
          ),
        ),
      ],
    );
  }
}
