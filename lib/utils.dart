import 'package:flutter/material.dart';
import 'package:flutter_movie_app/email_subscription/views/email_subscription_page.dart';
import 'package:flutter_movie_app/movie_list/pages/movie_list_page.dart';

buildDrawer (BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(child: Text('MVVM Practice')),
        ListTile(
          title: Text('Movie App'),
          leading: Icon(Icons.movie),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => MovieListPage()));
          },
        ),
        Divider(),
        ListTile(
          title: Text('Email Subscription App'),
          leading: Icon(Icons.email_outlined),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => EmailSubscriptionPage()));
          },
        ),
      ],
    ),
  );
}