// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pip_view/pip_view.dart';

class PipView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PIPView(
      builder: (context, isFloating) {
        return Scaffold(
          resizeToAvoidBottomInset: !isFloating,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text('This page will float!'),
                  MaterialButton(
                    color: Theme.of(context).primaryColor,
                    child: const Text('Start floating!'),
                    onPressed: () {
                      PIPView.of(context)!.presentBelow(BackgroundScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class BackgroundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text('This is the background page!'),
              const Text('If you tap on the floating screen, it stops floating.'),
              const Text('Navigation works as expected.'),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                child: const Text('Push to navigation'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => NavigatedScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigatedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigated Screen'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const <Widget>[
              Text('This is the page you navigated to.'),
              Text('See how it stays below the floating page?'),
              Text('Just amazing!'),
              Spacer(),
              Text('It also avoids keyboard!'),
              TextField(),
            ],
          ),
        ),
      ),
    );
  }
}