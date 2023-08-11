import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home.dart';
import 'page.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => HomePage());
    r.child(
      '/rota1',
      child: (context) => CustomPage(
        title: r.args.data['title'] ?? 'rota1',
        color: Colors.red,
      ),
    );
    r.child(
      '/rota2',
      child: (context) => CustomPage(
        title: r.args.data['title'] ?? 'rota2',
        color: Colors.yellow,
      ),
    );
    r.child(
      '/rota3',
      child: (context) => CustomPage(
        title: r.args.data['title'] ?? 'rota3',
        color: Colors.purple,
      ),
    );
    r.child(
      '/rota4',
      child: (context) => CustomPage(
        title: r.args.data['title'] ?? 'rota4',
        color: Colors.green,
      ),
    );
    r.child(
      '/rota5',
      child: (context) => CustomPage(
        title: r.args.data['title'] ?? 'rota5',
        color: Colors.brown,
      ),
    );
  }
}
