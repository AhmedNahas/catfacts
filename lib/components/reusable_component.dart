import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

AppBar defaultAppBar(
        {required BuildContext context,
        String? title,
        List<Widget>? actions,
        required bool showLeading}) =>
    AppBar(
      leading: showLeading
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
              ),
            )
          : null,
      title: Text(
        title!,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      actions: actions,
    );

Future showToast({required String msg, required Color backGround}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: backGround,
        textColor: Colors.white,
        fontSize: 16.0);
