import 'package:flutter/material.dart';
import 'package:widgets/incial.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    navegarParaOutraTela();
    super.initState();
  }

  navegarParaOutraTela() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (builder) => Inicial()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff034168),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/logoEstacio.png"),
            SizedBox(height: 15),
            Text(
              "Carregando",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
