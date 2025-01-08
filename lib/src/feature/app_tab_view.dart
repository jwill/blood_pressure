import 'package:blood_pressure_app/src/feature/blood_pressure_chart_view.dart';
import 'package:blood_pressure_app/src/feature/blood_pressure_list_view.dart';
import 'package:blood_pressure_app/src/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

class BloodPressureTabView extends StatefulWidget {
  BloodPressureTabView({super.key, required this.realm});

  static const routeName = '/';
  final Realm realm;

  @override
  State<BloodPressureTabView> createState() => _BloodPressureTabViewState();
}

class _BloodPressureTabViewState extends State<BloodPressureTabView> with TickerProviderStateMixin{
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(title: const Text('Blood Pressure Tracking',),
      actions: [IconButton(onPressed: (){
        Navigator.restorablePushNamed(context, SettingsView.routeName);
      }, icon: const Icon(Icons.settings))],
      bottom: TabBar(
        controller: _tabController,
        labelStyle: textTheme.titleLarge,
        tabs: const <Widget>[
        Tab(
          text: "Raw Data",
          icon: Icon(Icons.scatter_plot, size:28.0),
            ),
            Tab(
              text: "Chart",
              icon: Icon(Icons.monitor_heart, size: 28.0,),
            ),
      ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          BloodPressureListView(realm: widget.realm,),
          BloodPressureChartView(realm: widget.realm,)

      ]),
    ));
  }
}