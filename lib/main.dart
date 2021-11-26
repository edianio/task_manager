import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_tasks/controllers/task_controller.dart';
import 'package:my_tasks/controllers/user_controller.dart';
import 'package:my_tasks/screens/access/access_screen.dart';
import 'package:my_tasks/screens/base/base_screen.dart';
import 'package:my_tasks/screens/home/components/add_task.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (_) => UserController(),
          lazy: false,
        ),

        ChangeNotifierProvider(
          create: (context) => TaskController.withContext(context),
          lazy: true,
        ),

      ],
      child: MaterialApp(
        title: 'Task Manager',
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
          scaffoldBackgroundColor: const Color.fromARGB(255, 240, 240, 240),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.blueAccent,
                  elevation: 1,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w600
                  )
              )
          ),
          appBarTheme: const AppBarTheme(
            color: Colors.blueAccent,
            elevation: 0,
            centerTitle: true,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: (settings){
          switch(settings.name){
            case '/access':
              return MaterialPageRoute(builder: (_) => AccessScreen());
            case '/add_task':
              return MaterialPageRoute(builder: (_) => AddTask());
            case '/':
            default:
            //return MaterialPageRoute(builder: (_) => BaseScreen());
              return MaterialPageRoute(
                builder: (_) => AnimatedSplashScreen(
                  splash: const Text(
                    'Gerenciador Pessoal\nde Tarefas',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  nextScreen: BaseScreen(),
                  duration: 1500,
                  backgroundColor: Theme.of(context).primaryColor,
                  splashTransition: SplashTransition.fadeTransition,
                ),
              );
          }
        },
      ),
    );
  }
}
