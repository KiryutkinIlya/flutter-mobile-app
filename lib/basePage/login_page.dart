import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
              onPressed: () {
                login();
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                createAccount();
              },
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    final username = usernameController.text;
    final password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      // Обработка ошибки - не заполнены оба поля
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter both username and password.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    // Здесь вы можете проверить логин и пароль в SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final storedUsername = prefs.getString('username');
    final storedPassword = prefs.getString('password');

    if (username == storedUsername && password == storedPassword) {
      // Успешная авторизация
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Login successful.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/weatherPage');
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Неправильный логин или пароль
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Invalid username or password.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> createAccount() async {
    final username = usernameController.text;
    final password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      // Обработка ошибки - не заполнены оба поля
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter both username and password.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    // Генерировать уникальный идентификатор пользователя с помощью UUID
    final uuid = Uuid();
    final userId = uuid.v4();

    // Сохранить логин и пароль в SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('password', password);

    // Теперь у вас есть аккаунт с уникальным идентификатором
    showDialog(
        context: context,
        builder: (context) {
      return AlertDialog(
          title: Text('Account Created'),
    content: Text('Account created with ID: $userId'),
    actions: <Widget>[
    TextButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
      child: Text('OK'),
    ),
    ],
      );
        },
    );
  }
}