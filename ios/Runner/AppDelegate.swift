import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyCY_zby2fPlPi0770ZV3nuq3KwkbT5hCtA")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

import UIKit
import Flutter

