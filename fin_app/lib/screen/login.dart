import 'package:fin_app/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controllers/authcontroller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        // padding: EdgeInsets.only(
        //     left: 20, right: 20, top: size.height * 0.2, bottom: size.height * 0.5),
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     const Text("Hello, \nGoogle sign in",
        //         style: TextStyle(
        //             fontSize: 30
        //         )),
        //     GestureDetector(
        //         onTap: () {
        //           AuthService().signInWithGoogle();
        //         },
        //         child: const Image(width: 70, image: AssetImage('images/google.png'))),
        //   ],
        // ),
        child: Stack(
          children: [
            PageView(
              children: [
                Container(
                  width:double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/welcome.png'),
                      fit: BoxFit.fill
                    )
                  ),
                  child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Padding(
                              padding: const EdgeInsets.only(left: 30,bottom:50),
                              child: Container(
                                child: Text("Xin chào, \nĐăng nhập qua tài khoản Google",
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 1, 1)
                                  ), 
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.white,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("images/google.png",)
                                  )
                                ),
                              ),
                            )
                          ]
                        ),
                        Positioned(
                          width: 150,
                          height: 70,
                          bottom: 70,
                          child: GestureDetector(
                            child: ElevatedButton(
                              onPressed: (){
                                 AuthService().signInWithGoogle();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.blue),
                                foregroundColor: MaterialStateProperty.all(Colors.black),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )),
                                side: MaterialStateProperty.all(
                                  BorderSide(
                                    color: Colors.white
                                  )
                                )
                              ),
                              child: Text("Đăng nhập",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18
                              ),
                              ),
                            ),
                          )
                        )
                      ],
                    ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}