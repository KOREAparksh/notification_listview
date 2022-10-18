import 'package:flutter/material.dart';
import 'package:notification_listview/notification_status_bar.dart';
import 'package:notification_listview/notification_tile_icon.dart';
import 'package:notification_listview/notification_tile_info.dart';
import 'package:notification_listview/notification_type.dart';

class NotiListViewTile extends StatelessWidget {
  const NotiListViewTile({
    Key? key,
    this.title,
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
    this.space = 12.0,
    this.notiTileType = NotiTileType.normal,
    this.imageBackgroundColor = const Color(0xffd9d9d9),
    this.imageRatio = 1 / 1,
    this.imageAssets,
    this.titleStyle,
    this.contentStyle,
    this.isNew = false,
    this.onTapDelete,
  }) : super(key: key);

  ///This value is title of tile.
  final String? title;

  ///This value is content of tile.
  final String content;

  ///This is the height value of the tile.
  final double height;

  ///This is the radius value of the tile.
  final double radius;

  ///This is the elevation value of the tile.
  final double elevation;

  ///This value is the distance away from the tile above.
  final double divideMargin;

  ///This is the color value of the tile shadow.
  final Color shadowColor;

  ///This is the padding value of the inner side padding.
  final double sidePadding;

  ///This is the elevation value of the inner top, bottom tile.
  final double topBottomPadding;

  ///This is the min height value of the tile.
  final double tileMinHeight;

  ///This is the max height value of the tile image.
  final double imageMaxHeight;

  ///This is the max width value of the tile image.
  final double imageMaxWidth;

  ///This is the space value between image and info.
  final double space;

  ///This is the color value of the image's background color .
  final Color imageBackgroundColor;

  ///This is the ratio value of the image.
  final double imageRatio;

  ///This is the assets address of the image.
  final String? imageAssets;

  ///This is the type value of the card.
  final NotiTileType notiTileType;

  ///This is the text style value for custom title style.
  final TextStyle? titleStyle;

  ///This is the content style value for custom content style.
  final TextStyle? contentStyle;

  ///If this value is true, a badge is created in the upper left corner.
  final bool isNew;

  ///If this value is null, the button disappears from the tile.
  ///
  ///When deleting an element, you must use element remove, not index.
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
          decoration: _cardDecoration(),
          constraints: BoxConstraints(minHeight: tileMinHeight),
          child: Stack(
            children: [
              _tile(),
              _tileStatusBar(),
            ],
          ),
        ),
      ),
    );
  }

  Decoration? _cardDecoration() {
    if (notiTileType == NotiTileType.alert) {
      return BoxDecoration(
        border: Border.all(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(radius),
      );
    }
    return null;
  }

  Widget _tile() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        sidePadding,
        topBottomPadding,
        sidePadding,
        topBottomPadding,
      ),
      child: _tileBody(),
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
          iconBackgroundColor: imageBackgroundColor,
          imageRatio: imageRatio,
          notiTileType: notiTileType,
        ),
        SizedBox(width: space),
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

  Widget _tileStatusBar() {
    return NotiStatusBar(
      isNew: isNew,
      onTapDelete: onTapDelete,
    );
  }
}
