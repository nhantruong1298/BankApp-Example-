import 'package:bank_app/modules/home/widgets/card_overview.dart';
import 'package:bank_app/modules/home/widgets/finance_item.dart';
import 'package:bank_app/modules/home/widgets/your_balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money2/money2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _usdSymbol = Currency.create('USD', 1).symbol;
  final _listColors = [
    [Color(0xFFEAEAEA), Color(0xFFB2D0CE).withOpacity(0.85)],
    [Color(0xFFFCFFDF), Color(0xFFF1FE87).withOpacity(0.85)],
    [Color(0xFFF2EFF4), Color(0xFFB8A9C6).withOpacity(0.85)]
  ];
  final _listInfo = const [
    {'type': 'Salary', 'balance': '2,230', 'id': '6917'},
    {'type': 'Savings account', 'balance': '5,566', 'id': '4552'},
    {'type': 'Salary', 'balance': '2,230', 'id': '6917'}
  ];
  List<Map<String, dynamic>> _listFinance = const [
    {
      'img': 'assets/images/icon_start.png',
      'color': Color(0xFFF2FE8D),
      'title': 'My bonuses'
    },
    {
      'img': 'assets/images/icon_budget.png',
      'color': Color(0xFFB2D0CE),
      'title': 'My budget'
    },
    {
      'img': 'assets/images/icon_chart.png',
      'color': Color(0xFFAA9EB7),
      'title': 'Finance analysis'
    }
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
          height: size.height,
          width: size.width,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              color: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 32.h),
                    const YourBalance(),
                    SizedBox(height: 28.h),
                    Container(
                      height: 180.h,
                      width: ScreenUtil().screenWidth,
                      child: ListView.builder(
                          itemCount: _listColors.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return CardOverview(
                              onTap: () {},
                              colors: _listColors[index],
                              balance: _listInfo[index]['balance'],
                              id: _listInfo[index]['id'],
                              type: _listInfo[index]['type'],
                            );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 39.h, bottom: 12.h),
                      child: Text('FINANCE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500)),
                    ),
                    Container(
                        height: 100.w,
                        width: ScreenUtil().screenWidth,
                        child: ListView.builder(
                            itemCount: _listFinance.length,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (_, index) {
                              return FinanceItem(
                                  img: _listFinance[index]['img'].toString(),
                                  color: _listFinance[index]['color'],
                                  title: _listFinance[index]['title']);
                            })),
                    SizedBox(height: 36.h),
                  ]),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xFF252525),
                          Colors.black54,
                          Color(0xFF252525),
                        ]),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
              ),
            )
          ])),
    );
  }
}
