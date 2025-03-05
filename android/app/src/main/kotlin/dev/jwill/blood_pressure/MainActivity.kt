package dev.jwill.blood_pressure


import android.content.Context
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import androidx.health.connect.client.permission.HealthPermission
import androidx.health.connect.client.records.BloodPressureRecord
import androidx.health.connect.client.PermissionController
import androidx.health.connect.client.HealthConnectClient
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import androidx.health.connect.client.records.metadata.DataOrigin
import androidx.health.connect.client.request.ReadRecordsRequest
import io.flutter.plugin.common.JSONMethodCodec
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import org.json.JSONStringer
import java.time.Instant
import java.time.temporal.ChronoUnit
import kotlin.time.Duration


class MainActivity: FlutterFragmentActivity() {
    private val CHANNEL = "androidx.healthconnect"

    val PERMISSIONS = setOf(
        HealthPermission.getReadPermission(BloodPressureRecord::class),
        HealthPermission.getWritePermission(BloodPressureRecord::class)
    )

    val requestPermissionActivityContract = PermissionController.createRequestPermissionResultContract()

    val requestPermissions = registerForActivityResult(requestPermissionActivityContract) { granted ->
        if (granted.containsAll(PERMISSIONS)) {
            // Permissions successfully granted
        } else {
            // Lack of required permissions
        }
    }

    @RequiresApi(Build.VERSION_CODES.UPSIDE_DOWN_CAKE)
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "checkPermissions") {

                println(BloodPressureRecord::class)
                hasRequiredPermissions()


                result.success(true);
            }
            if (call.method == "m") {
                var before = Instant.now().minus(5, ChronoUnit.DAYS)
                var after = Instant.now().plus(5, ChronoUnit.DAYS)
                GlobalScope.launch() {
                    var x = readBloodPressure(before, after)
                    print(x)
                    result.success(x[0].toJson())
                }
            }
        }
    }

    fun BloodPressureRecord.toJson() : String {
        var obj = JSONStringer()
            .`object`()
                .key("time").value(this.time.toEpochMilli())
            .key("zoneOffset").value(this.zoneOffset)
            .key("systolic").value(this.systolic)
            .key("diastolic").value(this.diastolic)
            .key("bodyPosition").value(this.bodyPosition)
            .key("measurementLocation").value(this.measurementLocation)
            .endObject()
return obj.toString()
    }

    @RequiresApi(Build.VERSION_CODES.UPSIDE_DOWN_CAKE)
    suspend fun readBloodPressure(startTime: Instant, endTime: Instant): List<BloodPressureRecord> {
        var ascendingOrder: Boolean = false
        var pageSize = 10
        var request = ReadRecordsRequest<BloodPressureRecord>(
            timeRangeFilter = androidx.health.connect.client.time.TimeRangeFilter.between(startTime = startTime, endTime = endTime),
            pageSize = pageSize,
            pageToken = null
        )
        var client = HealthConnectClient.getOrCreate(MainActivity@ this as Context)
        var response = client.readRecords(request);
        println(response.records)
        return response.records;

    }

    @RequiresApi(Build.VERSION_CODES.UPSIDE_DOWN_CAKE)
    suspend fun readBloodPressure(start: Long, end: Long): List<BloodPressureRecord> {
        var startTime = Instant.ofEpochMilli(start)
        var endTime = Instant.ofEpochMilli(end)
        var ascendingOrder: Boolean = false
        var pageSize = 10
        var request = ReadRecordsRequest<BloodPressureRecord>(
            timeRangeFilter = androidx.health.connect.client.time.TimeRangeFilter.between(startTime = startTime, endTime = endTime),
            pageSize = pageSize,
            pageToken = null
        )
        var client = HealthConnectClient.getOrCreate(MainActivity@ this as Context)
        var response = client.readRecords(request);
        return response.records;

    }

            /*
            Future<JList<BloodPressureRecord>?> readBloodPressureRecords(DateTime start, DateTime end) async {
    var startInstant = JInstantExt.ofEpochMilli(start.millisecondsSinceEpoch.toJLong());
    var endInstant = JInstantExt.ofEpochMilli(end.millisecondsSinceEpoch.toJLong());
    var ascendingOrder = false;
    var pageSize = 10;
    var request = ReadRecordsRequest(BloodPressureRecord.type.jClass,
        TimeRangeFilter.between(startInstant, endInstant),
        {DataOrigin(JString.fromString('dev.jwill'))}.toJSet(DataOrigin.type), ascendingOrder, pageSize,"".toJString(), 0, T: BloodPressureRecord.type);

    var response = await healthConnectClient?.readRecords(request);
    return response?.getRecords();

  }
             */

    private fun hasRequiredPermissions(): Boolean {
        val granted = HealthConnectClient.getOrCreate(MainActivity@this).permissionController
        println(granted)
       // requestPermissions.launch(PERMISSIONS)
        return true
    }

}
