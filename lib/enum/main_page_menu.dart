import 'package:flutter/material.dart';
import 'package:flutter_luckyseastar_sample/ui/sample_clippath.dart';
import 'package:flutter_luckyseastar_sample/ui/sample_device_view.dart';
import 'package:flutter_luckyseastar_sample/ui/sample_gesture_detector.dart';
import 'package:flutter_luckyseastar_sample/ui/sample_chart.dart';
import 'package:flutter_luckyseastar_sample/ui/sample_scrollable_positioned_list.dart';
import 'package:flutter_luckyseastar_sample/ui/syncfusion/syncfusion_slider.dart';

enum MainPageMenus {

	sampleClipPath(
		"sampleClipPath",
		"sampleClipPath",
		SampleClipPathPage(),
	),
	sampleScrollablePositionedList(
		"sampleScrollablePositionedList",
		"sampleScrollablePositionedList",
		SampleScrollablePositionedListPage(),),
  sampleSyncfusionSlider(
      "SampleSyncfusionSlider",
      "SampleSyncfusionSlider",
      SampleSyncfusionSlider()),
  sampleChart(
      "SampleChart",
      "SampleChart",
      SampleChart()),
	sampleGestureDetetor(
		"sampleGestureDetector",
		"sampleGestureDetector",
		SampleGestureDetector()),

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