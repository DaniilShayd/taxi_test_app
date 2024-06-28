package com.unact.yandexmapkitexample;

import android.app.Application;

import com.yandex.mapkit.MapKitFactory;

public class MainApplication extends Application {
  @Override
  public void onCreate() {
    super.onCreate();
    MapKitFactory.setApiKey("08193f19-e195-4b07-8667-e239aff4b35b");
  }
}
