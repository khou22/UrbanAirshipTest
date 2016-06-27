//
//  AppDelegate.swift
//  UrbanAirshipTest
//
//  Created by Breathometer on 6/20/16.
//  Copyright © 2016 KevinHou. All rights reserved.
//

import UIKit

// Airship
import AirshipKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        print("You will not be able to receive push notifications in the simulator.")
        // Right now push notifications are only setup when the app is running in the background
        
        // Set log level for debugging config loading (optional)
        // It will be set to the value in the loaded config upon takeOff
        UAirship.setLogLevel(UALogLevel.Trace)
        
        // Populate AirshipConfig.plist with your app's info from
        // https://go.urbanairship.com
        // or set runtime properties here.
        let config: UAConfig = UAConfig.defaultConfig()
        // You can also programmatically override the plist values:
        // config.developmentAppKey = "YourKey"
        // etc.
        
        
        // Call takeOff (which creates the UAirship singleton)
        UAirship.takeOff(config)
        
        // Urban Airship
        let channelID = UAirship.push().channelID
        print("My Application Channel ID: \(channelID)")

        /*
         User notifications will not be enabled until
         userPushNotificationsEnabled is set YES on UAPush. Once enabled,
         the setting will be persisted and the user will be prompted to
         allow notifications. Normally, you should wait for a more
         appropriate time to enable push to increase the likelihood that
         the user will accept notifications.
         */
        UAirship.push().userPushNotificationsEnabled = true
        
        /* Open the system settings app directly to this application (on iOS 8+) */
//        UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
        
        
        // Reference: https://thatthinginswift.com/remote-notifications/
        let settings = UIUserNotificationSettings(forTypes: [.Badge, .Alert, .Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        UIApplication.sharedApplication().registerForRemoteNotifications()
        
        print("*** Ready to receive notifications... ***")
        
        return true
    }
    
    // Notification action callback
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?,forRemoteNotification userInfo: [NSObject : AnyObject], completionHandler: () -> Void) {
        print("Received actionable notification")
        print(identifier)
        print(userInfo)
    }
    
    // implemented in your application delegate
    // Reference: https://thatthinginswift.com/remote-notifications/
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        print("Got token data! \(deviceToken)")
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print("Couldn't register: \(error)")
    }
    
    // Good reference for when these are called: http://samwize.com/2015/08/07/how-to-handle-remote-notification-with-background-mode-enabled/
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        // Called in: Not Running
        print("Received remote notification")
        let alertController = UIAlertController(title: "Alert", message:
            "Received remote notification", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))  // Set button option
        
        self.window?.rootViewController?.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject], fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        // Called in: Foreground, Background, Suspended, when app is opened after not running at all and receiving an alert
        print("*** Received remote notification. User info:")
        print(userInfo)
//        let object = userInfo[0]!.valueForKey("aps")
//        let message: String = String(object!.valueForKey("alert"))
        let alertController = UIAlertController(title: "Alert", message:
            "Received remote notification", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))  // Set button option
        
        self.window?.rootViewController?.presentViewController(alertController, animated: true, completion: nil)
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        application.applicationIconBadgeNumber = 0;  // Reset the icon badge number when the app opens
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

