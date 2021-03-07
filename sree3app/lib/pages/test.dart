
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  //Controllers for e-mail and password textfields.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //Handling signup and signin
  bool signUp = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //e-mail textfield
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
          ),

          //password textfield
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
          ),

          //Sign in / Sign up button
          RaisedButton(
            onPressed: () {
              if (signUp) {
                //Provider sign up method
                context.read<AuthenticationProvider>().signUp(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
              } else {
                //Provider sign in method
                context.read<AuthenticationProvider>().signIn(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
              }
            },
            child: signUp ? Text("Sign Up") : Text("Sign In"),
          ),

          //Sign up / Sign In toggler
          OutlineButton(
            onPressed: () {
              setState(() {
                signUp = !signUp;
              });
            },
            child: signUp ? Text("Have an account? Sign In") : Text("Create an account"),
          )

        ],

      ),
    );

  }

}
class AuthenticationProvider {
  final FirebaseAuth firebaseAuth;

  AuthenticationProvider(this.firebaseAuth);

  Stream<User> get authState => firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> uid() async {
    return firebaseAuth.currentUser.uid;
  }
}