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
        
        // Populate AirshipConfig.plist with your app's info from https://go.urbanairship.com
        // or set runtime properties here.
        let config = UAConfig.defaultConfig()
        
        // You can also programmatically override the plist values:
        // config.developmentAppKey = "YourKey"
        // etc.
        
        // Call takeOff (which creates the UAirship singleton)
        UAirship.takeOff(config)
        
        // Urban Airship
        let channelID = UAirship.push().channelID
        print("My Application Channel ID: \(channelID)")

        
        // Set the notification types required for the app (optional). This value defaults
        // to badge, alert and sound, so it's only necessary to set it if you want
        // to add or remove types.
        UAirship.push().userNotificationTypes = ([UIUserNotificationType.Alert , UIUserNotificationType.Badge , UIUserNotificationType.Sound])

        // User notifications will not be enabled until userPushNotificationsEnabled is
        // set true on UAPush. Once enabled, the setting will be persisted and the user
        // will be prompted to allow notifications. Normally, you should wait for a more appropriate
        // time to enable push to increase the likelihood that the user will accept
        // notifications.
        UAirship.push().userPushNotificationsEnabled = true
        
        return true
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
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

