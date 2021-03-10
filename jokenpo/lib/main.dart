import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

String img_jogador = '';
String resultado = '';
int cpu;
String img_cpu = '';

class _MyAppState extends State<MyApp> {
  @override
  void CPU_Jogar() {
    int cpu;
    var r = Random();
    cpu = r.nextInt(3);
    if (cpu == 0) {
      img_cpu = "assets/pedra.png";
    } else if (cpu == 1) {
      img_cpu = 'assets/papel.png';
    } else if (cpu == 2) {
      img_cpu = 'assets/tesoura.png';
    }
    setState() {
      img_cpu = img_cpu;
    }
  }

  void Resultado() {
    if (img_jogador == 'assets/pedra.png') {
      if (img_cpu == "assets/pedra.png") {
        resultado = 'Empate!';
      } else if (img_cpu == "assets/papel.png") {
        resultado = 'O Computador venceu!';
      } else {
        resultado = 'Você venceu!';
      }
    } else if (img_jogador == 'assets/papel.png') {
      if (img_cpu == "assets/pedra.png") {
        resultado = 'Você venceu!';
      } else if (img_cpu == "assets/papel.png") {
        resultado = 'Empate!';
      } else {
        resultado = 'O Computador venceu!';
      }
    } else {
      if (img_cpu == "assets/pedra.png") {
        resultado = 'O Computador venceu!';
      } else if (img_cpu == "assets/papel.png") {
        resultado = 'Você venceu!';
      } else {
        resultado = 'Empate!';
      }
    }
    setState(() {
      resultado = resultado;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Jokenpo')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              img_jogador = 'assets/pedra.png';
                            });
                            CPU_Jogar();
                            Resultado();
                          },
                          child: Text("Pedra")),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              img_jogador = 'assets/papel.png';
                            });
                            CPU_Jogar();
                            Resultado();
                          },
                          child: Text("Papel")),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              img_jogador = 'assets/tesoura.png';
                            });
                            CPU_Jogar();
                            Resultado();
                          },
                          child: Text("Tesoura")),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text('Você escolheu: '),
                            Image.asset(img_jogador)
                          ],
                        ),
                        Column(
                          children: [
                            Text('O computador escolheu: '),
                            Image.asset(img_cpu)
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 40),
                    Text(resultado),
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
