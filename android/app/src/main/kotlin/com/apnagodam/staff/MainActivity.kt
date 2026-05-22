package com.apnagodam.staff

import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.media.AudioAttributes
import android.net.Uri
import android.os.Build
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

//    val soundUri: Uri = Uri.parse(
//        "android.resource://" +
//                applicationContext.packageName +
//                "/" +
//                R.raw.sound)
//    val audioAttributes = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP || Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
//      var attributes=  AudioAttributes.Builder()
//            .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
//            .setUsage(AudioAttributes.USAGE_ALARM)
//            .build()
//
//
//        val channel = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
//            NotificationChannel("noti_push_app_1", "noti_push_app", NotificationManager.IMPORTANCE_HIGH)
//        } else {
//            TODO("VERSION.SDK_INT < O")
//        }
//
//        channel.setSound(soundUri, attributes)
//
//        (getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager).createNotificationChannel(channel)
//    } else {
//        TODO("VERSION.SDK_INT < LOLLIPOP")
//    }


}
