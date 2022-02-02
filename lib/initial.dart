import 'package:flutter/material.dart';

class InitialView extends StatelessWidget {
  const InitialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter experiments'),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Text('Experiments that have been done', style: Theme.of(context).textTheme.headline3),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.topLeft,
            child: Wrap(
              children: const [
                _Option(title: 'Riverpod', to: '/riverpod'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Option extends StatelessWidget {
  final String title;
  final String? to;

  const _Option({Key? key, required this.title, this.to}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
      constraints: const BoxConstraints(maxWidth: 450),
      child: Card(
        elevation: 4,
        child: InkWell(
          onTap: to != null ? () => Navigator.of(context).pushNamed(to!) : null,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(title, style: Theme.of(context).textTheme.headline4),
          ),
        ),
      ),
    );
  }
}
