import 'package:flutter/material.dart';

import 'contant_pager.dart';

/*
 * 底部导航栏
 *
 */
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

/*
Scaffold  页面结构组件
Container 容器组件   容器边框  背景
 */
class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;

  //定义变量
  int _currentIndex = 0;

  final ContentPagerController _contentPagerController =
      ContentPagerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffedeef0), Color(0xffe6e7e9)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Center(
          child: ContentPager(
            contentPagerController: _contentPagerController,
            onPageChanged: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          //设置当前索引
          currentIndex: _currentIndex,
          onTap: (index) {
            _contentPagerController.jumpToPage(index);
            //修改状态
            setState(() {
              _currentIndex = index;
            });
          },
          //type类型   固定类型
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomItem("本周", Icons.folder, 0),
            _bottomItem("分享", Icons.explore, 1),
            _bottomItem("免费", Icons.donut_small, 2),
            _bottomItem("长按", Icons.person, 3),
          ]),
    );
  }

  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: _defaultColor,
        ),
        activeIcon: Icon(icon, color: _activeColor),
        title: Text(
          title,
          style: TextStyle(
              color: (_currentIndex != index) ? _defaultColor : _activeColor),
        ));
  }
}
