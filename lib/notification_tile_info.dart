import 'package:flutter/material.dart';
import 'package:notification_listview/notification_type.dart';

class NotiTileInfo extends StatelessWidget {
  const NotiTileInfo({
    Key? key,
    required this.title,
    required this.content,
    this.titleStyle,
    this.contentStyle,
    required this.notiTileType,
  }) : super(key: key);

  final String? title;
  final String content;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;
  final NotiTileType notiTileType;
  final _infoIntervalSize = 10.0;

  @override
  Widget build(BuildContext context) {
    return _notificationInfo();
  }

  Widget _notificationInfo() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleText(),
          _infoInterval(),
          _contentText(),
        ],
      ),
    );
  }

  Widget _titleText() {
    if (title == null || title!.isEmpty) {
      return Container();
    }
    return Text(
      title!,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: (titleStyle != null)
          ? titleStyle
          : const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
    );
  }

  Widget _infoInterval() {
    return (title == null || title!.isEmpty)
        ? const SizedBox()
        : SizedBox(height: _infoIntervalSize);
  }

  Widget _contentText() {
    return Text(
      content,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: (contentStyle != null)
          ? contentStyle
          : const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
    );
  }
}
