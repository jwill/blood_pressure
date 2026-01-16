import 'package:blood_pressure_app/src/data/bp_record.dart';
import 'package:csv/csv.dart';

class CsvService {
  String exportToCsv(List<BPRecord> records) {
    List<List<dynamic>> rows = [];
    
    // Add header
    rows.add(['Date', 'Systolic', 'Diastolic', 'Notes']);
    
    for (var record in records) {
      rows.add([
        record.date.toIso8601String(),
        record.systolic,
        record.diastolic,
        record.notes,
      ]);
    }
    
    return const ListToCsvConverter().convert(rows, eol: '\n');
  }

  List<BPRecord> importFromCsv(String csvString) {
    // Specify EOL to be more robust
    List<List<dynamic>> rows = const CsvToListConverter().convert(csvString, shouldParseNumbers: true, eol: '\n');
    
    if (rows.isEmpty) return [];
    
    // Check if first row is header
    int startRow = 0;
    if (rows[0].isNotEmpty && rows[0][0].toString().toLowerCase() == 'date') {
      startRow = 1;
    }
    
    List<BPRecord> records = [];
    for (var i = startRow; i < rows.length; i++) {
      var row = rows[i];
      if (row.length < 3) continue;
      
      try {
        DateTime? date;
        int systolic;
        int diastolic;
        String notes;

        // Check for 5 columns format (legacy: Date, Time, Systolic, Diastolic, Notes)
        // e.g. 2025-07-02,16:40,120,71,Missed dose by accident
        if (row.length >= 5 && row[1].toString().contains(':')) {
          date = DateTime.tryParse(row[0].toString());
          final timeStr = row[1].toString();
          final timeParts = timeStr.split(':');
          if (date != null && timeParts.length >= 2) {
            date = date.add(Duration(
              hours: int.parse(timeParts[0]),
              minutes: int.parse(timeParts[1]),
            ));
          }
          systolic = _toInt(row[2]);
          diastolic = _toInt(row[3]);
          notes = row[4].toString();
        } else {
          // Standard 4 columns format (Date-Time, Systolic, Diastolic, Notes)
          // e.g. 2025-07-02T16:40:00.000,120,71,Missed dose by accident
          date = DateTime.tryParse(row[0].toString());
          systolic = _toInt(row[1]);
          diastolic = _toInt(row[2]);
          notes = row.length > 3 ? row[3].toString() : "";
        }
        
        if (date == null) continue;
        
        records.add(BPRecord(
          date: date,
          systolic: systolic,
          diastolic: diastolic,
          notes: notes,
        ));
      } catch (e) {
        continue;
      }
    }
    
    return records;
  }

  int _toInt(dynamic value) {
    if (value is int) return value;
    if (value is double) return value.toInt();
    return int.parse(value.toString());
  }
}
