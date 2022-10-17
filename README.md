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




## Features

This package is for **Hyundai AutoEver** internship assignments.

This list view is optimized for the notification type used in the Hyundai AutoEver project.


## Usage

```dart
Scaffold(
    body:  NotificationListView(
            hasHeader: true,
            onTapSearch: () {}, //nullable
            onTapAll: () {},
            onTapAlert: () {},
            onTapNormal: () {},
            onTapChatting: () {},
            selectedType: null, // for header button color
            isSearching: false, // for button color
            itemCount: 7,
            itemBuilder: (context, int i) => NotiListViewTile(
                isFirst: (i == 0) ? true : false, // for top margin
                isNew: true, // for badge
                title: "title",
                content: "content",
                notiTileType: notiTileType.normal,
                ),
            ),
    );
```

## Showcase
![showcase1](./assets/showcase1.png)

## Additional information

NotificationListView is the same as listview.builder except for the header related properties.
