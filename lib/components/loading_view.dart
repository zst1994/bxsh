import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  //子布局
  final Widget child;

  //加载中能否显示
  final bool loading;

  //进度提示内容
  final String msg;

  //加载中动画
  final Widget progress;

  //背景透明度
  final double alpha;

  //背景颜色
  final Color bgColor;

  //字体颜色
  final Color textColor;

  ProgressDialog(
      {Key key,
      @required this.loading,
      this.msg,
      this.progress,
      this.alpha = 0.6,
      this.bgColor = Colors.black45,
      this.textColor = Colors.black87,
      @required this.child})
      : assert(child != null),
        assert(loading != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget layoutProgress;
    List<Widget> widgetList = [];
    widgetList.add(child);

    if (loading) {
      layoutProgress = Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(4.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              progress ??
                  CircularProgressIndicator(
                    // color: Theme.of(context).accentColor,
                  ),
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                child: Text(
                  msg ?? '正在加载...',
                  style: TextStyle(color: textColor, fontSize: 16.0),
                ),
              )
            ],
          ),
        ),
      );

      widgetList.add(Opacity(
        opacity: alpha,
        child: new ModalBarrier(color: bgColor),
      ));
      widgetList.add(layoutProgress);
    }
    return Stack(
      children: widgetList,
    );
  }
}
