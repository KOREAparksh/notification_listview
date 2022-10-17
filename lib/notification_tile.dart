import 'package:flutter/material.dart';
import 'package:notification_listview/notification_status_bar.dart';
import 'package:notification_listview/notification_tile_icon.dart';
import 'package:notification_listview/notification_tile_info.dart';
import 'package:notification_listview/notification_type.dart';

class NotiListViewTile extends StatelessWidget {
  const NotiListViewTile({
    Key? key,
    this.title,
    this.isFirst = false,
    required this.content,
    this.height = 102.0,
    this.radius = 10.0,
    this.elevation = 5,
    this.shadowColor = const Color(0x2b333333),
    this.divideMargin = 10.0,
    this.sidePadding = 15.0,
    this.topBottomPadding = 19.0,
    this.tileMinHeight = 100,
    this.imageMaxWidth = 150,
    this.imageMaxHeight = 150,
    this.imageInfoWidth = 12.0,
    this.notiTileType = NotiTileType.normal,
    this.imageBackgroundColor = const Color(0xffd9d9d9),
    this.imageRatio = 1 / 1,
    this.imageAssets,
    this.titleStyle,
    this.contentStyle,
    this.isNew = false,
    this.onTapDelete,
  }) : super(key: key);

  final bool isFirst;
  final String? title;
  final String content;
  final double height;
  final double radius;
  final double elevation;
  final double divideMargin;
  final Color shadowColor;
  final double sidePadding;
  final double topBottomPadding;
  final double tileMinHeight;
  final double imageMaxHeight;
  final double imageMaxWidth;
  final double imageInfoWidth;
  final Color imageBackgroundColor;
  final double imageRatio;
  final String? imageAssets;
  final NotiTileType notiTileType;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;

  final bool isNew;
  final VoidCallback? onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: divideMargin),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        elevation: elevation,
        shadowColor: shadowColor,
        child: Container(
          height: height,
          decoration: (notiTileType == NotiTileType.alert)
              ? BoxDecoration(
                  border: Border.all(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(radius),
                )
              : null,
          constraints: BoxConstraints(minHeight: tileMinHeight),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  sidePadding,
                  topBottomPadding,
                  sidePadding,
                  topBottomPadding,
                ),
                child: _tileBody(),
              ),
              NotiStatusBar(
                isNew: isNew,
                onTapDelete: onTapDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tileBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NotiTileIcon(
          height: height,
          imageMaxHeight: imageMaxHeight,
          imageMaxWidth: imageMaxWidth,
          imageInfoWidth: imageInfoWidth,
          iconBackgroundColor: imageBackgroundColor,
          imageRatio: imageRatio,
          notiTileType: notiTileType,
        ),
        SizedBox(width: imageInfoWidth),
        NotiTileInfo(
          title: title,
          content: content,
          titleStyle: titleStyle,
          contentStyle: contentStyle,
          notiTileType: notiTileType,
        ),
      ],
    );
  }
}
