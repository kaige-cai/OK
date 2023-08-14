import 'package:flutter/cupertino.dart';

final List<Widget> targetPages = [
  FirstPage(),
  SecondPage(),
  ThirdPage(),
  FourthPage(),
  FifthPage(),
];

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('1'),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('2'),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('3'),
    );
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('4'),
    );
  }
}

class FifthPage extends StatelessWidget {
  const FifthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('5'),
    );
  }
}
