import 'package:common/config/_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/navigations.dart';
import '../../../util/ui.dart';


class MainFrame extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry? padding;
  final Color? statusBarColor;

  MainFrame({
    required this.body,
    this.appBar,
    this.padding,
    this.statusBarColor,
  });

  @override
  Widget build(BuildContext context) => Frame(
    appBar: appBar,
    body: body,
    padding: padding,
    statusBarColor: statusBarColor,
  );
}

class NoAppBarFrame extends StatelessWidget {
  final Widget body;
  final EdgeInsetsGeometry? padding;
  final Color? statusBarColor;

  NoAppBarFrame({
    required this.body,
    this.padding,
    this.statusBarColor,
  });

  @override
  Widget build(BuildContext context) => Frame(
    body: body,
    padding: padding,
    statusBarColor: statusBarColor,
  );
}

class PlainBackFrame extends StatelessWidget {
  final Widget body;
  final EdgeInsetsGeometry? padding;
  final GestureTapCallback? onTap;
  final Color? statusBarColor;

  PlainBackFrame({
    required this.body,
    this.padding,
    this.onTap,
    this.statusBarColor,
  });

  @override
  Widget build(BuildContext context) => Frame(
    padding: padding,
    statusBarColor: statusBarColor,
    body: Stack(
      children: [
        body,
        Transform.scale(
          scale: 1.5,
          child: !isInitialPage(context)
            ? InkWell(
              onTap: onTap ?? () => backPage(context),
              customBorder: CircleBorder(),
              child: Icon(
                Icons.arrow_back_rounded,
              ).withPadding(EdgeInsets.all(5)),
            )
            : null,
        ),
      ],
    ),
  );
}
/*
class TopBarTitleAndBackFrame extends StatelessWidget {
  final Widget body;
  final String title;
  final Widget? topBarChild;
  final EdgeInsets? padding;

  TopBarTitleAndBackFrame({
    required this.body,
    required this.title,
    this.topBarChild,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    return Frame(
      padding: padding,
      body: Column(
        children: [
          RoundedTopNavBarTitleAndBack(
            title: title,
            bottomChild: topBarChild,
          ),
          body,
        ],
      ),
    );
  }
}

class TopBarProfileFrame extends StatelessWidget {
  final Widget body;
  final String name;
  final String? desc;
  final Widget image;
  final Widget? actionBtn;
  final EdgeInsets? padding;
  final void Function(BuildContext)? onActionBtnClick;

  TopBarProfileFrame({ //TODO 5 Juni 2021: Image akan sulit didapat jika dijadikan 1 sama Scaffold.
    required this.name,
    required this.image,
    required this.body,
    this.desc,
    this.actionBtn,
    this.onActionBtnClick,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Frame(
      padding: padding,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          RoundedTopNavBarProfile(
            name: name,
            desc: desc,
            image: image,
            actionBtn: actionBtn,
            onActionBtnClick: onActionBtnClick,
          ),
          Expanded(child: body,),
        ],
      ),
    );
  }
}

class TopBarTabFrame extends StatelessWidget {
  final String title;
  final EdgeInsets? padding;
  final List<Tab> tabs;
  final List<Widget> tabViews;

  TopBarTabFrame({ //TODO 5 Juni 2021: Image akan sulit didapat jika dijadikan 1 sama Scaffold.
    required this.title,
    required this.tabs,
    required this.tabViews,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Frame(
      padding: padding,
      body: DefaultTabController(
        length: tabs.length,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            RoundedTopNavBarTitleAndBack(
              title: title,
              bottomChild: TabBar(
                tabs: tabs,
              ),
            ),
            //body,
            Expanded(
              child: TabBarView(
                children: tabViews,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 */

class Frame extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry? padding;
  final Color? statusBarColor;

  Frame({
    required this.body,
    this.appBar,
    this.padding,
    this.statusBarColor,
  });

  @override
  Widget build(BuildContext context) {
    final bodyChild = SafeArea(
      child: Container(
        padding: padding,
        child: this.body,
      ),
    );

    final body = appBar != null ? bodyChild : Builder(
      builder: (ctx) {
        final topPadding = MediaQuery.of(ctx).padding.top;
        return Stack(
          children: [
            bodyChild,
            Container(
              color: statusBarColor ?? Manifest.theme.colorPrimary,
              height: topPadding,
              width: double.infinity,
            ),
          ],
        );
      },
    );

    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}

extension FramedWidgetExt on Widget {
  Widget framed({
    PreferredSizeWidget? appBar,
    EdgeInsetsGeometry? padding,
  }) => appBar != null
      ? MainFrame(body: this, appBar: appBar, padding: padding,)
      : NoAppBarFrame(body: this, padding: padding,);

  Widget framedWithPlainBack({
    EdgeInsetsGeometry? padding,
    GestureTapCallback? onTap,
  }) => PlainBackFrame(
    body: this,
    padding: padding,
    onTap: onTap,
  );
}