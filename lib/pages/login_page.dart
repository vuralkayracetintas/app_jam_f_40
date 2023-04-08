import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jam_app/pages/ana_sayfa.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _password;
  int _index = 0;
  void _submit() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      if (_username == 'user' && _password == '1234') {
        // Kullanıcı adı ve şifre doğruysa, bir sonraki sayfaya yönlendirin
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Ana_sayfa()),
        );
      } else {
        // Kullanıcı adı veya şifre yanlışsa, bir hata mesajı gösterin
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Kullanıcı adı veya şifre yanlış.'),
          ),
        );
      }
    }
  }

  final emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
  }

  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Uyari'),
        content: const Text('Şifreyi sıfırlamak için bizimle\n '
            'info@oyunveuygulamaakademisi.com'
            ' mail adresinden iletişime geçiniz'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Tamam',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7454E1),
      body: Stack(children: [
        ClipPath(
          clipper: CustomShape(),
          child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xff9A82E9)),
        ),
        Positioned(
          //left: 200,
          top: 550,
          child: ClipPath(
              clipper: CustomShape2(),
              child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xff9A82E9))),
        ),
        Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 100,
                      backgroundImage: AssetImage('assets/images/akademi.png')),
                  Tab(context),
                  const SizedBox(height: 30),
                  _index == 0 ? LoginMezun(context) : LoginBursiyer(context),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  IconButton onVisibilityIcon() {
    return IconButton(
      onPressed: _changeLoading,
      icon: AnimatedCrossFade(
          firstChild: const Icon(Icons.visibility_off_outlined),
          secondChild: const Icon(Icons.visibility_outlined),
          crossFadeState:
              _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 10)),
    );
  }

  @override
  Widget LoginBursiyer(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(Icons.account_balance_outlined),
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIconColor: Colors.deepPurpleAccent,
                  suffixIconColor: Colors.deepPurpleAccent,
                  prefixIcon: const Icon(Icons.mail_outline),
                  border: const OutlineInputBorder(),
                  labelText: 'E-Mail',
                  hintText: 'E-Mail Adresinizi Giriniz',
                  suffixIcon: emailController.text.isEmpty
                      ? Container(width: 0)
                      : IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            emailController.clear();
                          },
                        ),
                ),
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir kullanıcı adı girin.';
                  }
                  return null;
                },
                onSaved: (value) => _username = value!,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  prefixIconColor: const Color(0xff7454E1),
                  suffixIconColor: const Color(0xff7454E1),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: onVisibilityIcon(),
                  border: const OutlineInputBorder(),
                  labelText: 'Sifre',
                  hintText: 'Şifrenizi Giriniz',
                  //errorText: "a",
                  //suffix: onVisibilityIcon(),
                  //prefix: onVisibilityIcon(),
                ),
                obscureText: _isSecure,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir şifre girin.';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
              const SizedBox(height: 16),
              CupertinoButton(
                onPressed: () => _showAlertDialog(context),
                child: const Text('Şifremi Unuttum',
                    style: TextStyle(color: Colors.grey)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff7454E1),
                ),
                onPressed: _submit,
                child: const Text('Giriş Yap'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget LoginMezun(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(Icons.school),
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIconColor: Colors.deepPurpleAccent,
                  suffixIconColor: Colors.deepPurpleAccent,
                  prefixIcon: const Icon(Icons.mail_outline),
                  border: const OutlineInputBorder(),
                  labelText: 'E-Mail',
                  hintText: 'E-Mail Adresinizi Giriniz',
                  suffixIcon: emailController.text.isEmpty
                      ? Container(width: 0)
                      : IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            emailController.clear();
                          },
                        ),
                ),
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir kullanıcı adı girin.';
                  }
                  return null;
                },
                onSaved: (value) => _username = value!,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  prefixIconColor: Colors.deepPurpleAccent,
                  suffixIconColor: Colors.deepPurpleAccent,
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: onVisibilityIcon(),
                  border: const OutlineInputBorder(),
                  labelText: 'Sifre',
                  hintText: 'Şifrenizi Giriniz',
                ),
                obscureText: _isSecure,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir şifre girin.';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
              const SizedBox(height: 16),
              CupertinoButton(
                onPressed: () => _showAlertDialog(context),
                child: const Text('Şifremi Unuttum',
                    style: TextStyle(color: Colors.grey)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff7454E1),
                ),
                onPressed: _submit,
                child: const Text('Giriş Yap'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Tab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.12),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: _index == 0 ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Mezun girisi',
                        style: TextStyle(
                            color: _index == 0 ? Colors.black : Colors.white,
                            fontSize: 18,
                            fontWeight: _index == 0
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _index = 0;
                  });
                },
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: _index == 1 ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Bursiyer girisi',
                        style: TextStyle(
                            color: _index == 1 ? Colors.black : Colors.white,
                            fontSize: 18,
                            fontWeight: _index == 1
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _index = 1;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height);
    path.quadraticBezierTo(width * 0.6, height, width, height - 300);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomShape2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double height = size.height;
    double width = size.width;
    double controlPointX = width / 2;
    double controlPointY = height / 8;
    path.lineTo(0, height - 50);
    path.lineTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width, height - 50);
    path.quadraticBezierTo(controlPointX, controlPointY, 0, height - 50);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
