import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _showPassword = false;
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kayıt Ekranı'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Kullanıcı Adı'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(labelText: 'E-Posta'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if(value != null){
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Geçerli bir e-posta adresi girin';
                    }}
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                  ),
                  obscureText: !_showPassword,
                  validator: (value) {
                    if(value!=null){
                    if (value.isEmpty) {
                      return 'Şifre boş olamaz';
                    }}
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Şifreyi Tekrar Girin'),
                  obscureText: !_showPassword,
                  validator: (value) {
                    if(value!=null){
                    if (value.isEmpty || value != _passwordController.text) {
                      return 'Şifreler uyuşmuyor';
                    }}
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState !=null){
                    if (_formKey.currentState!.validate()) {
                      // Kayıt işlemini burada gerçekleştirin
                      // Örnek olarak, form verilerini alabilir ve işleyebilirsiniz.
                    }}
                  },
                  child: Text('Kayıt Ol'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}