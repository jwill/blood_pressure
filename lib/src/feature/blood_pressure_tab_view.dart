import 'package:blood_pressure_app/src/feature/blood_pressure_chart_view.dart';
import 'package:blood_pressure_app/src/feature/blood_pressure_list_view.dart';
import 'package:blood_pressure_app/src/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BloodPressureTabView extends StatefulWidget {
  const BloodPressureTabView({super.key});

  static const routeName = '/';

  @override
  State<BloodPressureTabView> createState() => _BloodPressureTabViewState();
}

class _BloodPressureTabViewState extends State<BloodPressureTabView>
    with TickerProviderStateMixin {
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
    final colorScheme = Theme.of(context).colorScheme;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Padding(
              padding: EdgeInsets.only(bottom: 16.0, top: 64.0, left: 16.0),
              child: Text("Blood\n pressure tracking", style: textTheme.headlineLarge?.copyWith(fontFamily: GoogleFonts.corben().fontFamily),),),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.restorablePushNamed(
                        context, SettingsView.routeName);
                  },
                  icon: const Icon(Icons.settings))
            ],
            bottom: PreferredSize(preferredSize: Size.fromHeight(125.0), child: Column(children:[
              TabBar(
                controller: _tabController,
                labelStyle: textTheme.titleSmall,
                labelColor: colorScheme.primary,
                tabs: <Widget>[
                  Tab(
                    //text: "My Data",
                    icon: Icon(Icons.favorite, size: 24.0),
                    text: "My data",
                  ),
                  Tab(
                    text: "Chart",
                    icon: Icon(
                      Icons.insert_chart,
                      size: 28.0,
                    ),
                  ),
                ])]))
          ),
          body:TabBarView(controller: _tabController, children: <Widget>[
            BloodPressureListView(),
            BloodPressureChartView()
            ]),)
        );
  }
}
