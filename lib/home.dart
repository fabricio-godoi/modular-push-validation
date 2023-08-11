// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

typedef PushFunction<T extends Object?> = Future<T?> Function(
  String routeName, {
  Object? arguments,
  bool forRoot,
});

class ModularPushParameters {
  final String path;
  final Object? arguments;
  final bool forRoot;

  ModularPushParameters(this.path, this.arguments, this.forRoot);
}

final List<ModularPushParameters> calls = <ModularPushParameters>[];
int callCounter = 0;

extension IModularNavigatorExt on IModularNavigator {
  Future<dynamic> pushNamedDelayed(
    String path, {
    Object? arguments,
    bool forRoot = false,
  }) async {
    await Future.delayed(Duration(milliseconds: 200 * (callCounter++)));
    callCounter--;

    return await Modular.to
        .pushNamed(path, arguments: arguments, forRoot: forRoot);
  }
}

void test(PushFunction function) {
  function('/rota1', arguments: {'title': '1'}, forRoot: true);
  function('/rota2', arguments: {'title': '2'}, forRoot: true);
  function('/rota3', arguments: {'title': '3'}, forRoot: true);
  function('/rota4', arguments: {'title': '4'}, forRoot: true);
  function('/rota5', arguments: {'title': '5'}, forRoot: true);
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => test(Modular.to.pushNamed),
              child: Text("Press to view error"),
            ),
            ElevatedButton(
              onPressed: () => test(Modular.to.pushNamedDelayed),
              child: Text("Press to test solution"),
            ),
          ],
        ),
      ),
    );
  }
}
