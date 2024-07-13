import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login and Signup Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthScreen(),
    );
  }
}

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  //Ask about this State<AuthScreen>
  bool _isLogin = true;

  void _toggleAuthMode() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login & Signup'),
      ),
      body: Center(
          child: _isLogin
              ? LoginForm(onSwitch: _toggleAuthMode)
              : SignupForm(
                  onSwitch: _toggleAuthMode,
                )),
    );
  }
}

class LoginForm extends StatefulWidget {
  final VoidCallback onSwitch; // Ask

  LoginForm({required this.onSwitch});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController =
      TextEditingController(); //ask TextEdittingController()
  bool _rememberMe = false;

  // predefined Credentials

  final String user1 = "rajendra@email.com";
  final String password1 = "mnb";

  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email == user1 && password == password1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful!!!')),
      );

      if (_rememberMe) {
        // save it
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid Credentials!')),
      );
    }
  }

  // forget Password

  void _forgetPassword() {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password Reset Link Sent To Your Email!")));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),

          //Remember me
          Row(
            children: [
              Checkbox(
                value: _rememberMe,
                onChanged: (bool? value) {
                  setState(() {
                    _rememberMe = value!;
                  });
                },
              ),
              Text('Remember Me'),
            ],
          ),

          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _login,
            child: Text('Login'),
          ),
          TextButton(
            onPressed: _forgetPassword,
            child: Text('Forget Password?'),
          ),
          TextButton(
            onPressed: widget.onSwitch,
            child: Text('Don\'t have an account? Signup'),
          ),
          // ),
        ],
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  final VoidCallback onSwitch;

  SignupForm({required this.onSwitch});

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _signup() {
    final email = _emailController.text;
    final password = _passwordController.text;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content:
              Text('Signup succesful!!! Email: $email, Password: $password')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // diff b/w child & children
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: ('Email'),
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _signup,
            child: Text('Sign up'),
          ),
          TextButton(
            onPressed: widget.onSwitch,
            child: Text('Alreary have an account? Login'),
          ),
        ],
      ),
    );
  }
}
