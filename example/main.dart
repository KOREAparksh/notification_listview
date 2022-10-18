import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notification_listview/notification_listview.dart';
import 'package:notification_listview/notification_tile.dart';
import 'package:notification_listview/notification_type.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const ListViewPage();
  }
}

//////////////////////////////////////////////////////////////////////////////

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
