import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  await Supabase.initialize(
    url: dotenv.env["SUPABASE_PROJECT_URL"]!,
    anonKey: dotenv.env["SUPABASE_PUBLISHABLE_KEY"]!,
  );
  runApp(MaterialApp(home: MyApp()));
}

final supabase = Supabase.instance.client;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();

  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'email'),
                onSaved: (value) {
                  _email = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'password'),
                onSaved: (value) {
                  _password = value;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  await _save();
                },

                child: Text("회원가입"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _login();
                },

                child: Text("로그인"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _save() async {
    _formKey.currentState!.save();
    print("Test2");
    print('emmial $_email password $_password');
    if (_password == null || _email == null) {
      return;
    }
    print("test");
    final response = await supabase.auth.signUp(
      password: _password!,
      email: _email!,
    );

    print(response.session);
    print(response.user);
  }

  Future<void> _login() async {
    _formKey.currentState!.save();

    final response = await supabase.auth.signInWithPassword(
      password: _password!,
      email: _email!,
    );

    print(response.session?.accessToken);
  }
}
