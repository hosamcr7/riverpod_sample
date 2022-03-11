import 'package:flutter/material.dart';








class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.white.withOpacity(0.2),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
