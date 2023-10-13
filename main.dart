import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = true,
      isLoading = true;

  Welcom() async {
    await Future.delayed(Duration(seconds: 4));
    isLoading = !isLoading;
    setState(() {});
  }
  @override
  void initState() {
   Welcom();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: isLoading? Scaffold(
        backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DotLottieLoader.fromAsset("assets/WELCOM.lottie",
              frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                if (dotlottie != null) {
                  return Lottie.memory(dotlottie.animations.values.single);
                } else {
                  return Container();
                }
              }),          Text("Welcome to el3iada",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontFamily: "Abril Fatface",
            color: Colors.blue[600]
          ),)
        ],
      )
      ) :
      Scaffold(
        backgroundColor: Colors.grey[100],
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: ClipRRect(
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(85)),
                child: Image.asset("assets/el3iada.jpg"),
              ),
            ),
            Positioned(
              top: 175,
              right: 12,
              child: Container(
                margin: EdgeInsets.all(20),
                height: 500,
                width: 325,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 5,
                          blurRadius: 10)
                    ]),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(50),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(25)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isLogin
                                          ? Colors.blue[700]
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: MaterialButton(
                                    onPressed: () {
                                      setState(() {
                                        isLogin = true;
                                      });
                                    },
                                    child: Text(
                                      "Log in",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: isLogin
                                              ? Colors.white
                                              : Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isLogin
                                          ? Colors.white
                                          : Colors.blue[700],
                                      borderRadius: BorderRadius.circular(25)),
                                  child: MaterialButton(
                                    onPressed: () {
                                      setState(() {
                                        isLogin = false;
                                      });
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: isLogin
                                              ? Colors.grey
                                              : Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Form(
                                  child: Column(
                                    children: [
                                      defaultTextFormField(
                                          type: TextInputType.emailAddress,
                                          hint: "Enter email or username",
                                          prefix: Icons.email_outlined),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      defaultTextFormField(
                                          type: TextInputType.visiblePassword,
                                          hint: "Password",
                                          prefix: Icons.lock_outline,
                                          suffix: Icons.visibility_outlined),
                                      isLogin
                                          ? Container(
                                        padding: EdgeInsets.all(10),
                                        width: double.infinity,
                                        child: Text(
                                          "Forrgot password ?",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.end,
                                        ),
                                      )
                                          : Column(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          defaultTextFormField(
                                              type: TextInputType
                                                  .visiblePassword,
                                              hint: "Confirm password",
                                              prefix: Icons.lock_outline,
                                              suffix:
                                              Icons.visibility_outlined),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      defauktMaterialButtom(
                                          text: isLogin ? "Log in" : "Sign in")
                                    ],
                                  )),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget defaultTextFormField({
  IconData? prefix,
  IconData? suffix,
  String? hint,
  @required TextInputType? type,
}) =>
    TextFormField(
      style: TextStyle(color: Colors.black54),
      cursorColor: Colors.grey,
      keyboardType: type,
      decoration: InputDecoration(
        hintText: "${hint}",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          prefix,
          color: Colors.grey[500],
        ),
        suffixIcon: Icon(
          suffix,
          color: Colors.grey[500],
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      ),
    );

Widget defauktMaterialButtom({
  @required String? text,
}) =>
    Container(
        width: 250,
        decoration: BoxDecoration(
            color: Colors.blue[700], borderRadius: BorderRadius.circular(25)),
        child: MaterialButton(
          onPressed: () {},
          child: Text(
            "${text}",
            style: TextStyle(color: Colors.white),
          ),
        ));
