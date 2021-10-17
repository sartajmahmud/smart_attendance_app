package com.csjunkie.smart_attendance

import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService
import android.app.NotificationChannel
import android.app.NotificationManager
import android.media.AudioAttributes
import android.net.Uri
import android.os.Build
import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.view.FlutterMain
import rekab.app.background_locator.IsolateHolderService
import io.flutter.plugins.pathprovider.PathProviderPlugin

class Application : FlutterApplication(), PluginRegistrantCallback {
    override fun onCreate() {
        super.onCreate()
        IsolateHolderService.setPluginRegistrant(this)
        FlutterMain.startInitialization(this)
//        val vibrationPattern = longArrayOf(200, 1000, 500, 1000, 500, 1000, 500, 1000, 500, 1000, 500, 1000, 500, 1000, 500, 1000, 500, 1000, 400, 900, 400, 900, 400, 900, 300, 800, 300, 800, 300, 800, 300, 600, 200, 600, 200, 600, 200, 600, 200, 600, 200, 600, 100, 600, 100, 600, 100)
//        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
//
//            val soundUri: Uri = Uri.parse(
//                    "android.resource://" +
//                            applicationContext.packageName +
//                            "/" +
//                            R.raw.sharp)
//
//            val audioAttributes = AudioAttributes.Builder()
//                    .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
//                    .setUsage(AudioAttributes.USAGE_NOTIFICATION_RINGTONE)
//                    .build()
//
//            val channel = NotificationChannel("noti_push_app_1",
//                    "noti_push_app",
//                    NotificationManager.IMPORTANCE_HIGH)
//            channel.setSound(soundUri, audioAttributes)
//            channel.enableVibration(true)
//            channel.vibrationPattern = vibrationPattern
//
//            val notificationManager = getSystemService(NotificationManager::class.java)
//            notificationManager.createNotificationChannel(channel)
//
//        }
        FlutterFirebaseMessagingService.setPluginRegistrant(this)
    }

    override fun registerWith(registry: PluginRegistry?) {
        if (!registry!!.hasPlugin("io.flutter.plugins.pathprovider")) {
            PathProviderPlugin.registerWith(registry.registrarFor("io.flutter.plugins.pathprovider"))
        }
        FirebaseCloudMessagingPluginRegistrant.registerWith(registry);
    }
}