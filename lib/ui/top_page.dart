import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:omikuji/value_notifiers/fortune_value_notifier.dart';
import 'package:omikuji/value_notifiers/loading_value_notifier.dart';

class TopPage extends StatelessWidget {
  final IFortuneRepository _repository;

  TopPage(this._repository);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoadingValueNotifier>(
          create: (_) => LoadingValueNotifier(),
        ),
        ChangeNotifierProvider<FortuneValueNotifier>(
          create: (context) => FortuneValueNotifier(
            _repository,
            Provider.of<LoadingValueNotifier>(context, listen: false),
          ),
        ),
      ],
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              title: const Text('おみくじ'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[_Result(), _Draw()],
            ),
          ),
          const _Loading(),
        ],
      ),
    );
  }
}

class _Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("called _WidgetA#build()");
    return Center(
      child: ValueListenableBuilder<String>(
        valueListenable:
            Provider.of<FortuneValueNotifier>(context, listen: false),
        builder: (_context, count, _child) =>
            Text('$count', style: Theme.of(context).textTheme.display1),
      ),
    );
  }
}

class _Draw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('called _WidgetC#build()');
    return RaisedButton(
      onPressed: () =>
          Provider.of<FortuneValueNotifier>(context, listen: false).draw(),
      child: Icon(Icons.refresh),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable:
          Provider.of<LoadingValueNotifier>(context, listen: false),
      builder: (_context, isLoading, _child) {
        return isLoading
            ? const DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0x44000000),
                ),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
