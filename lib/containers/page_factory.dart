import 'package:diet_driven/models/page.dart';
import 'package:diet_driven/presentation/adherence_page.dart';
import 'package:diet_driven/presentation/cycle_page.dart';
import 'package:diet_driven/presentation/diary_page.dart';
import 'package:diet_driven/presentation/diet_page.dart';
import 'package:diet_driven/presentation/manual_page.dart';
import 'package:diet_driven/presentation/settings_page.dart';
import 'package:diet_driven/presentation/statistics_page.dart';
import 'package:diet_driven/presentation/track_page.dart';
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
        name = "Stats";
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
        pageWidget = TrackPage();
        break;

      case Page.diet:
        pageWidget = DietPage();
        break;

      case Page.cycle:
        pageWidget = CyclePage();
        break;

      case Page.settings:
        pageWidget = SettingsPage();
        break;

      case Page.adherence:
        pageWidget = AdherencePage();
        break;

      case Page.statistics:
        pageWidget = StatisticsPage();
        break;

      case Page.manual:
        pageWidget = ManualPage();
        break;

      default:
        pageWidget = Icon(Icons.error_outline);
    }
    return pageWidget;
  }
}

