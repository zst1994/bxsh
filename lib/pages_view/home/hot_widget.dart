// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

// class HotWidget extends StatefulWidget {
//   HotWidget({Key key}) : super(key: key);

//   @override
//   _HotWidgetState createState() => _HotWidgetState();
// }

// class _HotWidgetState extends State<HotWidget> {
//   List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
//   RefreshController _refreshController =
//       RefreshController(initialRefresh: false);

//   void _onRefresh() async {
//     // monitor network fetch
//     await Future.delayed(Duration(milliseconds: 1000));
//     // if failed,use refreshFailed()
//     _refreshController.refreshCompleted();
//   }

//   void _onLoading() async {
//     // monitor network fetch
//     await Future.delayed(Duration(milliseconds: 1000));
//     // if failed,use loadFailed(),if no data return,use LoadNodata()
//     items.add((items.length + 1).toString());
//     if (mounted) setState(() {});
//     _refreshController.loadComplete();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SmartRefresher(
//       enablePullDown: true,
//       enablePullUp: true,
//       header: WaterDropHeader(),
//       footer: CustomFooter(
//         builder: (BuildContext context, LoadStatus mode) {
//           Widget body;
//           if (mode == LoadStatus.idle) {
//             body = Text("上拉加载");
//           } else if (mode == LoadStatus.loading) {
//             body = CupertinoActivityIndicator();
//           } else if (mode == LoadStatus.failed) {
//             body = Text("加载失败！点击重试！");
//           } else if (mode == LoadStatus.canLoading) {
//             body = Text("松手,加载更多!");
//           } else {
//             body = Text("没有更多数据了!");
//           }
//           return Container(
//             height: 55.0,
//             child: Center(child: body),
//           );
//         },
//       ),
//       controller: _refreshController,
//       onRefresh: _onRefresh,
//       onLoading: _onLoading,
//       child: ListView.builder(
//         itemBuilder: (c, i) => Card(child: Center(child: Text(items[i]))),
//         itemExtent: 100.0,
//         itemCount: items.length,
//       ),
//     );
//   }
// }
