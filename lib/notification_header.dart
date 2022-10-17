import 'package:flutter/material.dart';
import 'package:notification_listview/notification_type.dart';

class NotiListHeader extends StatelessWidget {
  const NotiListHeader({
    Key? key,
    this.height = 48.0,
    this.buttonHeight = 36.0,
    this.buttonMargin = const EdgeInsets.only(left: 5, right: 5),
    this.onTapSearch,
    this.isSearching = false,
    this.buttonRadius = 20,
    this.selectedType,
    required this.onTapAll,
    required this.onTapAlert,
    required this.onTapNormal,
    required this.onTapChatting,
  }) : super(key: key);

  final double height;
  final double buttonHeight;
  final EdgeInsets buttonMargin;
  final VoidCallback? onTapSearch;
  final bool isSearching;
  final double buttonRadius;
  final NotiTileType? selectedType;
  final VoidCallback onTapAll;
  final VoidCallback onTapAlert;
  final VoidCallback onTapNormal;
  final VoidCallback onTapChatting;

  final mainColor = const Color(0xff002c5f);
  final _allText = "전체";
  final _alertText = "긴급 / 위급 / 에러";
  final _normalText = "일반알림";
  final _chattingText = "채팅알림";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: height,
      child: Row(
        children: [_group(), _divider(), _trailing()],
      ),
    );
  }

  Widget _divider() {
    return Container(
      width: 1,
      height: double.infinity,
      color: mainColor,
    );
  }

  Widget _group() {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, right: 10),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _headerButton(
              str: _allText,
              isSelected: (selectedType == null) ? true : false,
            ),
            _headerButton(
              str: _alertText,
              isSelected: (selectedType == NotiTileType.alert) ? true : false,
            ),
            _headerButton(
              str: _normalText,
              isSelected: (selectedType == NotiTileType.normal) ? true : false,
            ),
            _headerButton(
              str: _chattingText,
              isSelected:
                  (selectedType == NotiTileType.chatting) ? true : false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerButton({
    required String str,
    bool isSelected = false,
    VoidCallback? onTap,
  }) {
    return Container(
      height: buttonHeight,
      margin: buttonMargin,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: (isSelected) ? mainColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(buttonRadius),
            ),
          ),
          side: BorderSide(color: mainColor),
        ),
        child: Text(
          str,
          style: TextStyle(
            color: (isSelected) ? Colors.white : Colors.black,
            fontWeight: (isSelected) ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _trailing() {
    if (onTapSearch == null) {
      return Container();
    }
    Color? iconColor = (isSearching) ? Colors.white : null;
    Color? backgroundColor = (isSearching) ? mainColor : null;
    return Container(
      height: height,
      color: backgroundColor,
      child: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: onTapSearch,
        icon: Icon(
          Icons.search,
          color: iconColor,
        ),
      ),
    );
  }
}
