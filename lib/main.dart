// ignore_for_file: non_constant_identifier_names
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _iconBool ? _darkTheme : _ligthTheme,
      home: Scaffold(
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

bool _iconBool = true;
IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

ThemeData _ligthTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.lightBlueAccent,
);
ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
);

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  void randomNumber() {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _iconBool ? _darkTheme : _ligthTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dicee'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _iconBool = !_iconBool;
                });
              },
              icon: Icon(_iconBool ? _iconDark : _iconLight),
            ),
          ],
        ),
        // backgroundColor: Colors.grey.shade500,
        body: Stack(
          children: [
            const RiveAnimation.asset("RiveAssets/reloadl.riv"),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: const SizedBox(),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 200,
                  width: 200,
                ),
                Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(
                              () {
                                leftDiceNumber = Random().nextInt(6) + 1;
                              },
                            );
                          },
                          child: Image.asset('images/dice$leftDiceNumber.png'),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(
                              () {
                                rightDiceNumber = Random().nextInt(6) + 1;
                              },
                            );
                          },
                          child: Image.asset('images/dice$rightDiceNumber.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _btnAnimationController.isActive = true;
                      setState(
                        () {
                          randomNumber();
                        },
                      );
                    },
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Stack(
                        children: [
                          RiveAnimation.asset(
                            "RiveAssets/button.riv",
                            // RiveAnimation.asset("RiveAssets/reloadl.riv",
                            controllers: [_btnAnimationController],
                          ),
                          Positioned.fill(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(width: 8),
                              Text(
                                "Tirar ambos",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.purple),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
