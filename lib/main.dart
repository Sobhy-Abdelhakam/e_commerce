import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/helpers/shared_pref_helper.dart';
import 'package:e_commerce/core/routing/app_routes.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  
  final url = dotenv.env['URL'] ?? '';
  final anonKey = dotenv.env['ANON_KEY'] ?? '';
  await Supabase.initialize(
    url: url,
    anonKey: anonKey,
  );
  // String? token = Supabase.instance.client.auth.currentSession?.accessToken;
  String? token = await SharedPrefHelper.getString(SharedPrefKeys.userToken);
  // if(token != null){
  //   Supabase.instance.client.auth.recoverSession(token);
  // }

  if (token.isEmpty){
    isUserLoggedIn = true;
  } else {
    isUserLoggedIn = false;
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      // home: const Scaffold(
      //   body: LoginScreen(),
      // ),
      initialRoute: isUserLoggedIn ? Routes.navigationMenu : Routes.login,
      onGenerateRoute: AppRoutes().generateRoute,
    );
  }
}
