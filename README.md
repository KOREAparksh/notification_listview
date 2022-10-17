<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

This package is for Hyundai Auto Ever internship assignments.
This list view is optimized for the notification type used in the Hyundai Auto Ever project.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
Scaffold(
    body:  NotificationListView(
            hasHeader: true,
            onTapSearch: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("123"),
                ));
            },
            onTapAll: () {},
            onTapAlert: () {},
            onTapNormal: () {},
            onTapChatting: () {},
            selectedType: null,
            isSearching: false,
            itemCount: 7,
            itemBuilder: (context, int i) => NotiListViewTile(
                isFirst: (i == 0) ? true : false,
                isNew: true,
                title: "123",
                content: "이 알림Tile은 서비스 일반 안내 시 사용됩니다.",
                notiTileType: list[0],
                ),
            ),
    );
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
