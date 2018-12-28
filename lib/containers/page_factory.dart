import 'package:diet_driven/models/page.dart';
import 'package:flutter/material.dart';

abstract class PageFactory {
  static String toText(Page page) {
    String name;
    switch (page) {
      case Page.diary:
        name = "Diary";
        break;

      case Page.track:
        name = "Track";
        break;

      case Page.diet:
        name = "Diets";
        break;

      case Page.cycle:
        name = "Cycles";
        break;

      case Page.settings:
        name = "Settings";
        break;

      default:
        name = "ERROR";
    }
    return name;
  }

  static Icon toIcon(Page page) {
    Icon icon;
    switch (page) {
      case Page.diary:
        icon = Icon(Icons.home);
        break;

      case Page.track:
        icon = Icon(Icons.event_note);
        break;

      case Page.diet:
        icon = Icon(Icons.fastfood);
        break;

      case Page.cycle:
        icon = Icon(Icons.repeat);
        break;

      case Page.settings:
        icon = Icon(Icons.settings);
        break;

      default:
        icon = Icon(Icons.error_outline);
    }
    return icon;
  }

  static Widget toPage(Page page) {
    Widget pageWidget;
    switch (page) {
      case Page.diary:
        pageWidget = Container(color: Colors.redAccent,);
        break;

      case Page.track:
        pageWidget = Container(color: Colors.blueAccent,);
        break;

      case Page.diet:
        pageWidget = Container(color: Colors.pinkAccent,);
        break;

      case Page.cycle:
        pageWidget = Container(color: Colors.orangeAccent,);
        break;

      case Page.settings:
        pageWidget = Container(color: Colors.greenAccent,);
        break;

      default:
        pageWidget = Icon(Icons.error_outline);
    }
    return pageWidget;
  }
}

