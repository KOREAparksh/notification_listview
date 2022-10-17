import 'package:flutter/material.dart';

class NotiStatusBar extends StatelessWidget {
  const NotiStatusBar({
    Key? key,
    required this.isNew,
    this.onTapDelete,
  }) : super(key: key);

  final bool isNew;
  final VoidCallback? onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _badge(),
          _trash(),
        ],
      ),
    );
  }

  Widget _badge() {
    return Icon(
      Icons.circle,
      size: (isNew) ? 10 : 0,
      color: Colors.red,
    );
  }

  Widget _trash() {
    if (onTapDelete == null) {
      return Container();
    }
    return GestureDetector(
      onTap: onTapDelete,
      child: const SizedBox(
        height: 20,
        child: Icon(
          Icons.delete_rounded,
          size: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
