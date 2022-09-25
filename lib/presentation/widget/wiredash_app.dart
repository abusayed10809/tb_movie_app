import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final Widget child;

  const WiredashApp({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(projectId: "tbmovieapp-ju7havj", secret: "ScZstLdjrP_ejRLxdxPf7kaMpx0D2HvK", child: child,);
  }
}
