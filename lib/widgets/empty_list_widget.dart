import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';








class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key,  this.onRefresh,this.text="There is no data to show"}) : super(key: key);
  final VoidCallback? onRefresh;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(iconSize: 35,icon: Icon(Icons.refresh),onPressed: () {
            onRefresh?.call();
          }),
          SizedBox(height: 8),

          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
            ),
          ),

        ],
      ),
    );
  }
}
