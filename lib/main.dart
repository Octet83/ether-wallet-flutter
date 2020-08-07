import 'package:ambwallet/app_config.dart';
import 'package:ambwallet/router.dart';
import 'package:ambwallet/services_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  // bootstrapping;
  WidgetsFlutterBinding.ensureInitialized();
  final stores = await createProviders(AppConfig().params["ambrosus"]);

  runApp(MainApp(stores));
}

class MainApp extends StatelessWidget {
  MainApp(this.stores);
  final List<SingleChildCloneableWidget> stores;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: stores,
        child: new MaterialApp(
          title: 'Flutter App',
          initialRoute: '/',
          routes: getRoutes(context),
          theme: ThemeData(
            unselectedWidgetColor:Colors.white,
            hintColor: Colors.white,
            primaryColor: Colors.white,
            primaryColorDark: Colors.white,
            textTheme: TextTheme(body2: TextStyle(color: Colors.white)),
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.white,
              textTheme: ButtonTextTheme.primary,
            ),
          ),
        ));
  }
}
