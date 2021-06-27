import 'package:bank_app/modules/home/widgets/custom_navigationbar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavigationBar extends StatefulWidget {
  final void Function(int) onChangedIndex;
  final int defaultSelectedIndex;
  const CustomNavigationBar(
      {required this.onChangedIndex, this.defaultSelectedIndex = 0, Key? key})
      : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final _listIcon = const [
    'assets/images/Home.png',
    'assets/images/Shop.png',
    'assets/images/Card.png',
    'assets/images/Chat.png',
    'assets/images/History.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        height: 82.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_listIcon.length, (index) {
            return CustomNavigationBarItem(
              onTap: () {
                widget.onChangedIndex(index);
              },
              img: _listIcon[index],
            );
          }).toList(),
        ),
      ),
    );
  }
}
