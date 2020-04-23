import 'package:flutter/material.dart';

class ContentPager extends StatefulWidget {
  final ValueChanged<int> onPageChanged;

  final ContentPagerController contentPagerController;

  //构造方法   Key:默认的构造方法  可选参数
  const ContentPager({Key key, this.onPageChanged, this.contentPagerController})
      /**初始化列表**/
      : super(key: key);

  @override
  _ContentPagerState createState() => _ContentPagerState();
}

class _ContentPagerState extends State<ContentPager> {
  PageController _pageController = PageController(
      //视图比例
      viewportFraction: 0.8);
  static List<Color> _colors = [
    Colors.blue,
    Colors.red,
    Colors.deepPurple,
    Colors.green
  ];

  @override
  void initState() {
    if (widget.contentPagerController != null) {
      widget.contentPagerController._pageController = _pageController;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //实现上下布局
    return Column(
      children: <Widget>[
        //设置appBar

        //Expanded 充满 高度撑开
        Expanded(
            //PageView 可滑动的组件
            child: PageView(
          controller: _pageController,
          onPageChanged: widget.onPageChanged,
          children: <Widget>[
            _wrapItem(0),
            _wrapItem(1),
            _wrapItem(2),
            _wrapItem(3),
          ],
        ))
      ],
    );
  }

  //返回一个带边距的容器
  Widget _wrapItem(int index) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(color: _colors[index]),
      ),
    );
  }
}

//内容区域控制器
class ContentPagerController {
  PageController _pageController;

  //改变pageView的指针页面
  void jumpToPage(int page) {
    //dart  安全调用 ?.   防止空指针
    _pageController?.jumpToPage(page);
  }
}
