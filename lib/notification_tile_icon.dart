import 'package:flutter/material.dart';
import 'package:notification_listview/notification_type.dart';

class NotiTileIcon extends StatelessWidget {
  const NotiTileIcon({
    Key? key,
    required this.height,
    required this.imageMaxHeight,
    required this.imageMaxWidth,
    required this.imageInfoWidth,
    required this.iconBackgroundColor,
    required this.imageRatio,
    required this.notiTileType,
    this.imageAssets,
  }) : super(key: key);

  final double height;
  final double imageMaxHeight;
  final double imageMaxWidth;
  final double imageInfoWidth;
  final Color iconBackgroundColor;
  final double imageRatio;
  final String? imageAssets;
  final NotiTileType notiTileType;
  final _defaultNormalImageAsset = "assets/autoever_logo.png";

  @override
  Widget build(BuildContext context) {
    return _icon();
  }

  Widget _icon() {
    switch (notiTileType) {
      case NotiTileType.normal:
        return _normalImage();
      case NotiTileType.chatting:
        return _chattingImage();
      case NotiTileType.alert:
        return _alertImage();
      case NotiTileType.emergency:
        return _alertImage();
      default:
        return _normalImage();
    }
  }

  Widget _normalImage() {
    return Container(
      constraints: BoxConstraints(
        maxHeight: imageMaxWidth,
        maxWidth: imageMaxHeight,
      ),
      color: iconBackgroundColor,
      child: AspectRatio(
        aspectRatio: imageRatio,
        child: Image.asset(
          imageAssets ?? _defaultNormalImageAsset,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _chattingImage() {
    final iconSize =
        (height / 2 > imageMaxHeight) ? imageMaxHeight : height / 2;
    return Container(
      constraints: BoxConstraints(
        maxHeight: imageMaxWidth,
        maxWidth: imageMaxHeight,
      ),
      decoration: BoxDecoration(
        shape: (notiTileType == NotiTileType.chatting)
            ? BoxShape.circle
            : BoxShape.rectangle,
        color: iconBackgroundColor,
      ),
      child: AspectRatio(
        aspectRatio: imageRatio,
        child: (imageAssets == null)
            ? Icon(Icons.person, size: iconSize)
            : Image.asset(
                imageAssets!,
                fit: BoxFit.contain,
              ),
      ),
    );
  }

  Widget _alertImage() {
    return Container(
      constraints: BoxConstraints(
        maxHeight: imageMaxWidth,
        maxWidth: imageMaxHeight,
      ),
      child: AspectRatio(
        aspectRatio: imageRatio,
        child: Icon(
          Icons.warning,
          size: height / 2 + 10,
          color: Colors.red,
        ),
      ),
    );
  }
}
