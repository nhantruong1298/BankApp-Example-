import 'package:bank_app/modules/home/bloc/change_page_bloc.dart';
import 'package:bank_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (BuildContext context) => ChangePageBloc(-1))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () => GetMaterialApp(
              title: 'Bank App',
              defaultTransition: Transition.rightToLeft,
              transitionDuration: Duration(milliseconds: 300),
              initialRoute: RoutesManager.initialRoute,
              // supportedLocales: [
              //   const Locale.fromSubtags(languageCode: 'vi'),
              //   const Locale.fromSubtags(languageCode: 'en'),
              // ],
              // locale: const Locale('vi', 'VN'),
              debugShowCheckedModeBanner: false,
              getPages: RoutesManager.getPages,
            ));
  }
}
