import 'package:flutter/material.dart';
import 'package:flutter_experiments/exp/riverpod/views/countermessage/countermessage_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterMessageView extends ConsumerWidget {
  CounterMessageView({Key? key}) : super(key: key);

  final counterMessageController = ChangeNotifierProvider<CounterMessageController>(
    (ref) => CounterMessageController(),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with Riverpod'),
      ),
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button this many times', style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 15),
            Consumer(builder: (builder, ref, _) {
              return Text(
                ref.watch(counterMessageController.select((value) => value.counter)).toString(),
                style: Theme.of(context).textTheme.subtitle1,
              );
            }),
            const SizedBox(height: 45),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Text('Your message is: '),
                  Consumer(builder: (context, ref, _) {
                    return Text(
                      ref.watch(counterMessageController.select((value) => value.message)),
                      style: Theme.of(context).textTheme.subtitle1,
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(counterMessageController.notifier).increment();
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          onChanged: ref.read(counterMessageController.notifier).changeMessage,
          decoration: const InputDecoration(
            hintText: 'Enter your message',
          ),
        ),
      ),
    );
  }
}
