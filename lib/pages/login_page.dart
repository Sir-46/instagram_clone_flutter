import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: getBottomNavigationBar(),
      body: getBody(size),
    );
  }

  Widget getBottomNavigationBar() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 10),
        height: 30,
        decoration: BoxDecoration(
            border: Border(top: BorderSide(width: 1, color: Colors.grey[300]))),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('หากยังไม่มีบัญชี'),
            SizedBox(
              width: 3,
            ),
            InkWell(
              onTap: () {
                print('register');
              },
              child: Text(
                'สมัครเลย',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        )),
      ),
    );
  }

  Widget getBody(size) {
    return Container(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/logo.svg',
            height: 50,
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 15),
            width: size.width - 50,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  hintText: 'หมายเลขโทรศัพท์ อีเมล หรือชื่อผู้ใช้'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            width: size.width - 50,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey[500]),
                hintText: 'รหัสผ่าน',
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText
                        ? Icons.visibility_off_sharp
                        : Icons.visibility_outlined,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              obscureText: _obscureText,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: size.width - 50,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: InkWell(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamedAndRemoveUntil(
                        '/', (Route<dynamic> route) => false);
              },
              child: Center(
                  child: Text(
                'เข้าสู่ระบบ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
