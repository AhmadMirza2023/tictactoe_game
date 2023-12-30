import 'package:flutter/material.dart';
import 'package:tictactoe/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool turn = true;
  List<String> displayOX = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int Oscore = 0;
  int Xscore = 0;
  int filledBox = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text(
                              'Player O',
                              style: myNewFontWhite,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              Oscore.toString(),
                              style: myNewFontWhite,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text(
                              'Player X',
                              style: myNewFontWhite,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              Xscore.toString(),
                              style: myNewFontWhite,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: primaryColor,
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(
                        10,
                      ),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          displayOX[index],
                          // index.toString(),
                          style: myNewFontBlack.copyWith(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Text(
                'TICTACTOE',
                style: myNewFontWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void tapped(int index) {
    setState(() {
      if (turn && displayOX[index] == '') {
        displayOX[index] = 'O';
        filledBox += 1;
      } else if (!turn && displayOX[index] == '') {
        displayOX[index] = 'X';
        filledBox += 1;
      }

      turn = !turn;
      _win();
    });
  }

  void _win() {
    if (displayOX[0] == displayOX[1] &&
        displayOX[0] == displayOX[2] &&
        displayOX[0] != '') {
      _showDialog(displayOX[0]);
    }
    if (displayOX[3] == displayOX[4] &&
        displayOX[3] == displayOX[5] &&
        displayOX[3] != '') {
      _showDialog(displayOX[3]);
    }
    if (displayOX[6] == displayOX[7] &&
        displayOX[6] == displayOX[8] &&
        displayOX[6] != '') {
      _showDialog(displayOX[6]);
    }
    if (displayOX[0] == displayOX[3] &&
        displayOX[0] == displayOX[6] &&
        displayOX[0] != '') {
      _showDialog(displayOX[0]);
    }
    if (displayOX[1] == displayOX[4] &&
        displayOX[1] == displayOX[7] &&
        displayOX[1] != '') {
      _showDialog(displayOX[1]);
    }
    if (displayOX[2] == displayOX[5] &&
        displayOX[2] == displayOX[8] &&
        displayOX[2] != '') {
      _showDialog(displayOX[2]);
    }
    if (displayOX[0] == displayOX[4] &&
        displayOX[0] == displayOX[8] &&
        displayOX[0] != '') {
      _showDialog(displayOX[0]);
    }
    if (displayOX[2] == displayOX[4] &&
        displayOX[2] == displayOX[6] &&
        displayOX[2] != '') {
      _showDialog(displayOX[2]);
    }

    if (filledBox == 9) {
      return _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('DRAW'),
          actions: [
            TextButton(
              onPressed: () {
                _clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Play Again?',
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'WINNER : ' + winner,
          ),
          actions: [
            TextButton(
              onPressed: () {
                _clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Play Again?',
              ),
            ),
          ],
        );
      },
    );

    if (winner == 'O') {
      Oscore += 1;
    } else if (winner == 'X') {
      Xscore += 1;
    }
  }

  void _clear() {
    setState(
      () {
        for (int i = 0; i < 9; i++) {
          displayOX[i] = '';
        }
      },
    );
    filledBox = 0;
  }
}

class GoogleFonts {
  static pressStart2p({required TextStyle textStyle, required Color color}) {}
}
