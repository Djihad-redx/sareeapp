import 'dart:async';
import 'package:cron/cron.dart';
import 'package:flutter_lock_screen/flutter_lock_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:sree3app/category/AllCategory.dart';
import 'package:sree3app/globals.dart';
import 'package:sree3app/pages/Cart.dart';
import 'package:sree3app/pages/TimerCode.dart';
import 'package:sree3app/pages/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:sree3app/category/games.dart';
import 'package:sree3app/category/cinma.dart';

import 'package:sree3app/category/itsalat.dart';
import 'package:sree3app/category/markit.dart';
import 'package:sree3app/category/program.dart';
import 'package:sree3app/category/ituns.dart';
import 'package:sree3app/category/new_internit.dart';
import 'package:sree3app/pages/login.dart';
import 'package:sree3app/pages/time.dart';
import 'package:sree3app/widget/drawer.dart';
import 'package:sree3app/login/auth.dart';
import 'package:provider/provider.dart';

import 'login/login_screen.dart';


Future<void> main() async  {
  // const oneSec = const Duration(seconds:10);
  // new Timer.periodic(oneSec, (Timer t) =>runApp(MaterialApp(home: PassCodeScreen(),)));

  // void justWait({@required int numberOfSeconds}) async {
  //   await Future.delayed(Duration(seconds: numberOfSeconds));
  // }


  // await justWait(numberOfSeconds: 5);
   WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();


 runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: ThemeData(fontFamily: 'DIN Next LT W23',brightness: Brightness.light,
          primaryColor: Colors.red,),

        darkTheme: ThemeData(
          brightness: Brightness.dark,
          accentTextTheme: TextTheme(caption:TextStyle(color: Colors.black) , ),
          textTheme: TextTheme(caption:TextStyle(color: Colors.black) , ),

        ),
      ),
    ),);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // Timer timer;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   timer = Timer.periodic(Duration(seconds: 15), (Timer t) => PassCodeScreen());
  // }
  //
  // @override
  // void dispose() {
  //   timer?.cancel();
  //   super.dispose();
  // }
  final navigatorKey = GlobalKey<NavigatorState>();
  void _initializeTimer() {
    if (TimerCode.timer!= null) {
      TimerCode.timer.cancel();
    }
    TimerCode.timer = Timer(const Duration(seconds: 180), handleTimeout);
  }
  void _logOutUser() {
    TimerCode.timer?.cancel();
    TimerCode.timer = null;
  }
  void _handleUserInteraction([_]) {
    _initializeTimer();
  }
  bool isFingerprint = false;
  var myPass = [1,2,3,4];
  void handleTimeout() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LockScreen(
        title: "This is Screet ",
        passLength: myPass.length,
        bgImage: "assets/bg.jpg",
        fingerPrintImage: "assets/fingerprint.png",
        showFingerPass: true,
        numColor: Colors.blue,
        fingerVerify: isFingerprint,
        borderColor: Colors.white,
        showWrongPassDialog: true,
        wrongPassContent: "Wrong pass please try again.",
        wrongPassTitle: "Opps!",
        wrongPassCancelButtonText: "Cancel",
        passCodeVerify: (passcode) async {
          for (int i = 0; i < myPass.length; i++) {
            if (passcode[i] != myPass[i]) {
              return false;
            }
          }
          return true;
        },
        onSuccess: () {
          Navigator.of(context).pop();
          setState(() {
            _initializeTimer();
          });
        }),));
  }
  bool ok = true;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _initializeTimer();
    super.initState();
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _logOutUser();
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LockScreen(
          title: "This is Screet",
          passLength: myPass.length,
          bgImage: "assets/bg.jpg",
          fingerPrintImage: "assets/fingerprint.png",
          showFingerPass: true,
          numColor: Colors.blue,
          fingerVerify: isFingerprint,
          borderColor: Colors.white,
          showWrongPassDialog: true,
          wrongPassContent: "Wrong pass please try again.",
          wrongPassTitle: "Opps!",
          wrongPassCancelButtonText: "Cancel",
          passCodeVerify: (passcode) async {
            for (int i = 0; i < myPass.length; i++) {
              if (passcode[i] != myPass[i]) {
                return false;
              }
            }
            return true;
          },
          onSuccess: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyApp(),));
            setState(() {
              _logOutUser();
              _initializeTimer();
            });
          }),));
    }if (state == AppLifecycleState.paused){
      _logOutUser();
    }
  }
  Widget build(BuildContext context) {

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _handleUserInteraction,
      onPanDown: _handleUserInteraction,
      child: WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          backgroundColor: Colors.yellow.shade200,
          endDrawer: AppDrawer(),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Text("Sree3",style: TextStyle(color: Colors.black)),
            backgroundColor: Color(0xfffed700),
            leading: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart(),));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left:12.0),
                  child: Icon(Icons.shopping_cart,size: 35,),
                )),
          ),
          body: SingleChildScrollView(
            child: Container(
             // width:double.infinity ,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Container(child:
                    InkWell(child: Image.asset('assets/imge/new/rasid.png'), onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllCategory(1, "شحن رصيد وانترنت")),
                      );
                    },),
                      // width: double.infinity,
                    ),
                    SizedBox(height: 30,),
                    Container(child:
                    InkWell(child: Container(child: Image.asset('assets/imge/new/ishtrak.png')),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllCategory(3, "اشتراكات العاب")),
                        );
                      },),
                      // width: double.infinity,
                    ),
                    SizedBox(height: 30,),
                    Container(child:
                    InkWell(child: Container(child: Image.asset('assets/imge/new/play.png')), onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllCategory(4, "اشتراكات العاب")),
                      );
                    },),
                     // width: double.infinity,
                    ),
                    SizedBox(height: 30,),
                    Container(child:
                    InkWell(child: Image.asset('assets/imge/new/cinma.png'), onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllCategory(5, "اشتراكات السينما")),
                      );
                    },),
                      // width: double.infinity,
                    ),

                    SizedBox(height: 30,),
                    Container(child:
                    InkWell(child: Image.asset('assets/imge/new/markit.png'), onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllCategory(6, "تسوق عبر الانترنت")),
                      );
                    },),
                      // width: double.infinity,
                    ),
                    SizedBox(height: 30,),
                    Container(child:
                    InkWell(child: Image.asset('assets/imge/new/ituns.png'), onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllCategory(7, "ايتونز")),
                      );
                    },),
                      // width: double.infinity,
                    ),
                    SizedBox(height: 30,),
                    Container(child:
                    InkWell(child: Image.asset('assets/imge/new/program.png'),onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllCategory(8, "البرامج والتطبيقات")),
                      );
                    },),
                      // width: double.infinity,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('هل تريد الخروج'),
          content: Text('هل انت متاكد انك تريد الخروج.....؟'),
          actions: <Widget>[
            FlatButton(
              child: Text('لا'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text('نعم'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            )
          ],
        );
      },
    ) ?? false;
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => PassCodeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imge/logo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationProvider>().authState,
        )
      ],
      child: MaterialApp(
        title: 'Firebase Authentication',
        home: Authenticate(),
        theme: ThemeData(fontFamily: 'DIN Next LT W23'),
      ),
    );
  }
}
class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Instance to know the authentication state.
  //   final firebaseUser = context.watch<User>();
  //
  //   if (firebaseUser != null) {
  //     //Means that the user is logged in already and hence navigate to HomePage
  //     return MyApp();
  //   }
  //   //The user isn't logged in and hence navigate to SignInPage.
  //   return LoginScreen();
     return  Consumer<Auth>(builder: (context, auth, child){
       if (!auth.authenticated){
         return LoginScreen2();
       }
       else{
         return MyApp();
       }
     });
   }
}
class Isauth extends StatefulWidget {
  @override
  _IsauthState createState() => _IsauthState();
}

class _IsauthState extends State<Isauth> {
  @override
  final storage = new FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    readToken();
  }

  void readToken() async {
    Token = await storage.read(key: 'token');
    //Provider.of<Auth>(context, listen: false).tryToken(token: token);
    print(Token);
  }
  Widget build(BuildContext context) {
    return Consumer<Auth>(builder: (context, auth, child){
      if (!auth.authenticated){
        return LoginScreen2();
      }
      else{
        return MyApp();
      }
    });
  }
}
