import 'dart:io';

import 'package:blood_pressure_app/src/data/bp_record.dart';
import 'package:blood_pressure_app/src/data/bp_record_signal.dart';
import 'package:blood_pressure_app/src/feature/blood_pressure_input_bottom_sheet.dart';
import 'package:blood_pressure_app/src/feature/blood_pressure_item_details_view.dart';
import 'package:blood_pressure_app/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:jni/jni.dart';
import 'package:signals/signals_flutter.dart';

/// Displays a list of SampleItems.
class BloodPressureListView extends StatefulWidget {
  const BloodPressureListView({
    super.key,
    required this.controller,
  });

  final SettingsController controller;

  static const routeName = '/list';

  @override
  State<BloodPressureListView> createState() => _BloodPressureListViewState();
}

class _BloodPressureListViewState extends State<BloodPressureListView> {
  late JObject hostContext;
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      hostContext = JObject.fromReference(Jni.getCachedApplicationContext());
    }

    final surfaceContainerHighest = Color(0xFFf7dcdd);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _syncWithHealthConnect,
        child: _buildList(context),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {
            showModalBottomSheet<void>(context: context,
                backgroundColor: surfaceContainerHighest,
                builder: (BuildContext context) {
                  return BloodPressureInputBottomSheet(healthConnectService: widget.controller.healthConnectService);
                })
             /* _dialogBuilder(context)*/},
          child: const Icon(Icons.add)),
    );
  }

  Color pickColorForBP(BPRecord record) {
    if (record.systolic <= 120 && record.diastolic <= 80) {
      return Color(0xFF008652);
    } else if (record.systolic <= 130 && record.diastolic <= 85) {
      return Color(0xFFF0DC17);
    } else if (record.systolic >= 140 || record.diastolic >= 90) {
      return Colors.red;
    } else {
      return Colors.orange;
    }
  }

  Color pickColorForBPText(BPRecord record) {
    if (record.systolic <= 120 && record.diastolic <= 80) {
      return Color(0xFFF6FFF5);
    } else if (record.systolic <= 130 && record.diastolic <= 85) {
      return Color(0xFF696000);
    } else if (record.systolic >= 140 || record.diastolic >= 90) {
      return Colors.black;
    } else {
      return Color(0xFF302202);
    }
  }

  Widget _buildItem(BuildContext context, BPRecord item) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final notoSans = GoogleFonts.notoSans();
    final neutral70 = Color(0xFFB4A9A8);
    final data = item.notes.isNotEmpty
        ? "${item.systolic}/${item.diastolic} - ${item.notes}"
        : "${item.systolic}/${item.diastolic}";
    return GestureDetector(
        onTap: () {
          Navigator.restorablePushNamed(
              context, BloodPressureItemDetailsView.routeName,
              arguments: <String, String>{
                'date': item.date.toString(),
                'systolic': item.systolic.toString(),
                'diastolic': item.diastolic.toString(),
                'notes': item.notes,
              });
        },
        child: Card(
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    topRight: Radius.circular(24),
                    bottomRight: Radius.circular(24))),
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 8,
                      height: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.schedule, size: 16, color: neutral70,),
                            SizedBox(width:4),
                            Text(DateFormat('hh:mm aaa').format(item.date), style: notoSans.copyWith(color: neutral70, fontSize: 12),)
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Icon(Icons.event, size: 16, color: neutral70,),
                            SizedBox(width:4),
                            Text(DateFormat('dd MMM').format(item.date), style: notoSans.copyWith(color: neutral70, fontSize: 12),)
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 56,
                        width: 284,
                        decoration: BoxDecoration(
                            color: pickColorForBP(item),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        child: Baseline(
                          baseline: 24,
                          baselineType: TextBaseline.alphabetic,
                          child: Text(
                            "${item.systolic} / ${item.diastolic}",
                            style: GoogleFonts.concertOne().copyWith(
                              color: pickColorForBPText(item),
                                fontSize: textTheme.titleLarge?.fontSize),
                          ),
                        )),
                  ],
                ))));
  }

  Widget _buildList(BuildContext context) {
    final signal = SignalProvider.of<BPRecordSignal>(context)!;

    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, child) {
        return Watch((context) {
          final allRecords = signal.value;
          List<BPRecord> displayRecords;

          if (widget.controller.showLowestOnly) {
            // Group by day and find lowest systolic
            final Map<String, BPRecord> lowestPerDay = {};
            
            for (var record in allRecords) {
              final dateKey = DateFormat('yyyy-MM-dd').format(record.date);
              if (!lowestPerDay.containsKey(dateKey) || 
                  record.systolic < lowestPerDay[dateKey]!.systolic) {
                lowestPerDay[dateKey] = record;
              }
            }
            displayRecords = lowestPerDay.values.toList()
              ..sort((a, b) => a.date.compareTo(b.date));
          } else {
            displayRecords = allRecords;
          }

          return ListView.builder(
            restorationId: 'bloodPressureItemListView',
            itemCount: displayRecords.length,
            itemBuilder: (BuildContext context, int index) {
              final item = displayRecords[index];
              return _buildItem(context, item);
            },
          );
        });
      },
    );
  }


  Future<void> _syncWithHealthConnect() async {
    final service = widget.controller.healthConnectService;
    if (!service.isConnected.value) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Health Connect is not connected')),
        );
      }
      return;
    }

    final now = DateTime.now();
    final thirtyDaysAgo = now.subtract(const Duration(days: 30));
    
    final records = await service.readBloodPressure(thirtyDaysAgo, now);
    
    if (records.isNotEmpty) {
      final signal = SignalProvider.of<BPRecordSignal>(context, listen: false)!;
      final currentRecords = signal.value;
      
      // Merge unique records
      final Map<DateTime, BPRecord> recordMap = {
        for (var r in currentRecords) r.date: r
      };
      
      int addedCount = 0;
      for (var record in records) {
        if (!recordMap.containsKey(record.date)) {
          recordMap[record.date] = record;
          addedCount++;
        }
      }
      
      if (addedCount > 0) {
        final newList = recordMap.values.toList()
          ..sort((a, b) => a.date.compareTo(b.date));
        signal.value = newList;
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Synced $addedCount new records from Health Connect')),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No new records found in Health Connect')),
          );
        }
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No records found in Health Connect for the last 30 days')),
        );
      }
    }
  }
}
