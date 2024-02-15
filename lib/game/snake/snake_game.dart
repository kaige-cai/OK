import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SnakeGame extends StatefulWidget {
  const SnakeGame({super.key});

  @override
  State<SnakeGame> createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  final int squaresPerRow = 20;

  final int squaresPerCol = 43;

  List<int> snake = [];

  var direction = 'down';

  var isPlaying = false;

  int food = 0;

  @override
  void initState() {
    resetGame();
    super.initState();
  }

  void resetGame() {
    snake = [(squaresPerRow * squaresPerCol / 2).floor()];
    direction = 'down';
    food = Random().nextInt(squaresPerRow * squaresPerCol);
    while (snake.contains(food)) {
      food = Random().nextInt(squaresPerRow * squaresPerCol);
    }
  }

  void startGame() {
    isPlaying = true;

    Timer.periodic(const Duration(milliseconds: 200), (Timer timer) {
      setState(() {
        moveSnake();
        if (checkGameOver()) {
          timer.cancel();
          isPlaying = false;
          showGameOverDialog();
        }
        if (snake.first == food) {
          snake.add(food); // Grow snake
          generateNewFood();
        }
      });
    });
  }

  void moveSnake() {
    switch (direction) {
      case 'down':
        if (snake.first >= squaresPerRow * (squaresPerCol - 1)) {
          snake.insert(0, snake.first - squaresPerRow * (squaresPerCol - 1));
        } else {
          snake.insert(0, snake.first + squaresPerRow);
        }
        break;
      case 'up':
        if (snake.first < squaresPerRow) {
          snake.insert(0, snake.first + squaresPerRow * (squaresPerCol - 1));
        } else {
          snake.insert(0, snake.first - squaresPerRow);
        }
        break;
      case 'left':
        if (snake.first % squaresPerRow == 0) {
          snake.insert(0, snake.first + squaresPerRow - 1);
        } else {
          snake.insert(0, snake.first - 1);
        }
        break;
      case 'right':
        if ((snake.first + 1) % squaresPerRow == 0) {
          snake.insert(0, snake.first - squaresPerRow + 1);
        } else {
          snake.insert(0, snake.first + 1);
        }
        break;
    }
    if (snake.length > 1) {
      snake.removeLast(); // 防止蛇在开始时生长
    }
  }

  void generateNewFood() {
    food = Random().nextInt(squaresPerRow * squaresPerCol);
    while (snake.contains(food)) {
      food = Random().nextInt(squaresPerRow * squaresPerCol);
    }
  }

  bool checkGameOver() {
    for (int i = 1; i < snake.length; i++) {
      if (snake[i] == snake.first) {
        return true;
      }
    }
    return false;
  }

  void showGameOverDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('游戏结束'),
          content: Text('你的分数: ${snake.length}'),
          actions: <Widget>[
            TextButton(
              child: const Text('关闭'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  resetGame();
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return GestureDetector(
      onTap: () {
        if (!isPlaying) startGame();
      },
      onVerticalDragUpdate: (details) {
        // 添加检查以启动游戏
        if (!isPlaying) startGame();
        if (direction != 'up' && details.delta.dy > 0) {
          direction = 'down';
        } else if (direction != 'down' && details.delta.dy < 0) {
          direction = 'up';
        }
      },
      onHorizontalDragUpdate: (details) {
        // 添加检查以启动游戏
        if (!isPlaying) startGame();
        if (direction != 'left' && details.delta.dx > 0) {
          direction = 'right';
        } else if (direction != 'right' && details.delta.dx < 0) {
          direction = 'left';
        }
      },
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: squaresPerRow * squaresPerCol,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: squaresPerRow,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (snake.contains(index)) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(color: Colors.green[500]),
                ),
              ),
            );
          }
          if (index == food) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(color: Colors.red),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
