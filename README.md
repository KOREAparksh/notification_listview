[![pub package](https://img.shields.io/badge/publisher-Park%20Seunghan-green)](https://github.com/KOREAparksh/notification_listview)
[![pub package](https://img.shields.io/badge/pub-v1.1.0-blue)](https://github.com/KOREAparksh/notification_listview)

<h1 align="center">Notification ListView</h1>

<p align="center">
<a href="https://www.hyundai-autoever.com/kor/main/index.do" target="_blank" rel="noreferrer noopener">
    <img src="https://www.hyundai.co.kr/image/upload/asset_library/MDA00000000000000179/5640ebe4255e4960a93e218f29f44a6d.png" width="50%" alt="logo">
</a>
</p>

<p align="center">
  <a >
    <img src="https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white" />
  </a>
  <a>
    <img src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white">
  </a>
</p>

---


This **NotificationListView Package** is optimized for the notification type used in the **Hyundai AutoEver internship assignments**.

---


## Features

- Shows data according to notification type.
- Same as listview.builder except for itembuilder and header related properties.


## Getting Start
Add the package to your pubspec.yaml.
```yaml
notification_listview: ^1.1.0
```

import the library in your file.
```dart
import 'package:notification_listview/notification_listview.dart';
import 'package:notification_listview/notification_tile.dart';
```

In the T part, put the data class for your list.

```dart
List<String> list = [];

NotificationListView<String>
//NotificationListView<T>
```

In groupby, write a function that returns the NotiTileType of each element.
```dart
class Temp {
  ...
  final NotiTileType notiTileType = NotiTileType.alert;
  ...
}

...
groupBy: (element) => element.notiTileType,
...
```

## Showcase

<p>
  <a >
    <img src="https://raw.githubusercontent.com/KOREAparksh/notification_listview/main/assets/showcase1.png" width="49%"/>
    <img src="https://raw.githubusercontent.com/KOREAparksh/notification_listview/main/assets/showcase2.png" width="49%"/>
  </a>
</p>


## Example

```dart

class Temp {
  final NotiTileType notiTileType;
  final String title;
  final String content;

  const Temp(this.notiTileType, this.title, this.content);

  @override
  String toString() {
    return 'Temp{title: $title, type: $notiTileType}\n';
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final List<Temp> list = const [
    Temp(NotiTileType.alert, "title", "content"),
    Temp(NotiTileType.normal, "title", "content"),
    Temp(NotiTileType.chatting, "title", "content"),
    Temp(NotiTileType.alert, "title", "content"),
    Temp(NotiTileType.normal, "title", "content"),
    Temp(NotiTileType.chatting, "title", "content"),
    Temp(NotiTileType.alert, "title", "content"),
    Temp(NotiTileType.normal, "title", "content"),
    Temp(NotiTileType.chatting, "title", "content"),
    Temp(NotiTileType.alert, "title", "content"),
    Temp(NotiTileType.normal, "title", "content"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text("Notification ListView"),
      ),
      body: Container(
        color: Colors.black12,
        child: NotificationListView<Temp>(
          elements: list,
          groupBy: (element) => element.notiTileType,
          hasHeader: true,
          onTapSearch: () => print("tap search button"),
          isSearching: false,
          itemCount: list.length,
          indexItemBuilder: (context, e, i) => NotiListViewTile(
            isNew: true,
            title: e.title,
            content: e.content,
            notiTileType: e.notiTileType,
            onTapDelete: () => print("tap delete button"),
          ),
        ),
      ),
    );
  }
}
```

## Additional information
- This package only support Korean.

## Contact
- tmdgks22222@gmail.com
- tmdgks2222@naver.com
