import 'package:flutter/material.dart';
import 'package:flutter_luckyseastar_sample/ui/sample_chart.dart';
import 'package:flutter_luckyseastar_sample/ui/syncfusion/syncfusion_slider.dart';

enum MainPageMenus {
  sampleSyncfusionSlider(
      "SampleSyncfusionSlider",
      "SampleSyncfusionSlider",
      SampleSyncfusionSlider()),

  sampleChart(
      "SampleChart",
      "SampleChart",
      SampleChart()),

	undefined('undefined','', null);

	const MainPageMenus(this.code, this.name, this.widget);

	final String code;
	final String name;
  final Widget? widget;

	factory MainPageMenus.getByCode(String code) {
		return MainPageMenus.values.firstWhere((value) => value.code == code,
		orElse: () => MainPageMenus.undefined);
	}
}