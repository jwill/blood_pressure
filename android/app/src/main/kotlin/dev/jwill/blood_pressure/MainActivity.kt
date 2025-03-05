package dev.jwill.blood_pressure

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import androidx.health.connect.client.permission.HealthPermission
import androidx.health.connect.client.records.BloodPressureRecord
import androidx.health.connect.client.PermissionController
import androidx.health.connect.client.HealthConnectClient
import androidx.annotation.NonNull


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
            println("here")
        } else {
            // Lack of required permissions
            println("no perms")
        }
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "checkPermissions") {

                println(BloodPressureRecord::class)
                hasRequiredPermissions()

                result.success(true);
            }
        }


    }


    private fun hasRequiredPermissions(): Boolean {
        val granted = HealthConnectClient.getOrCreate(MainActivity@this).permissionController
        println(granted)
       // requestPermissions.launch(PERMISSIONS)
        return true
    }

}
