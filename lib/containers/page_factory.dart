import 'package:diet_driven/models/page.dart';
import 'package:diet_driven/presentation/diary_page.dart';
import 'package:diet_driven/presentation/settings_page.dart';
import 'package:flutter/material.dart';

abstract class PageFactory {
  // TODO: internationalization library
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

      case Page.adherence:
        name = "Adherence";
        break;

      case Page.statistics:
        name = "Statistics";
        break;

      case Page.manual:
        name = "Manual";
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

      case Page.adherence:
        icon = Icon(Icons.save);
        break;

      case Page.statistics:
        icon = Icon(Icons.ac_unit);
        break;

      case Page.manual:
        icon = Icon(Icons.open_with);
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
        pageWidget = DiaryPage();
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
        pageWidget = SettingsPage();
        break;

      case Page.adherence:
        pageWidget = Container(color: Colors.amberAccent);
        break;

      case Page.statistics:
        pageWidget = Container(color: Colors.indigoAccent);
        break;

      case Page.manual:
        pageWidget = Container(color: Colors.deepPurpleAccent);
        break;

      default:
        pageWidget = Icon(Icons.error_outline);
    }
    return pageWidget;
  }
}

