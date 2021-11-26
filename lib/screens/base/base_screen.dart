import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_tasks/controllers/page_manager.dart';
import 'package:my_tasks/controllers/user_controller.dart';
import 'package:my_tasks/screens/access/access_screen.dart';
import 'package:my_tasks/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: Consumer<UserController>(
        builder: (_, userController, __){

          if(!userController.isLoggedIn){
            return AccessScreen();
          }

          return PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[

              HomeScreen(),

            ],
          );
        },
      ),
    );
  }
}