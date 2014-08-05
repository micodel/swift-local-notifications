//
//  AppDelegate.swift
//  swift local notifications
//
//  Created by Michael Hamel on 8/3/14.
//  Copyright (c) 2014 Michael Hamel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        // Override point for customization after application launch.

        // Actions
        // -------
        
        // Background activation reloads some data but does not launch app.
        // Foreground activiation will launch app and show some data.
        
        // FIRST ACTION
        
        var firstAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        firstAction.identifier = "FIRST_ACTION"
        firstAction.title = "First Action"

    
        // This makes the firstAction a background activiation.

        firstAction.activationMode = UIUserNotificationActivationMode.Background
        // Will warn user with a red background.
        firstAction.destructive = true
        firstAction.authenticationRequired = false
        
        
        // SECOND ACTION
        var secondAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        secondAction.identifier = "SECOND_ACTION"
        secondAction.title = "Second Action"
        
        // This makes the secondAction a foreground activiation.
        secondAction.activationMode = UIUserNotificationActivationMode.Foreground
        // Will warn user with a red background.
        secondAction.destructive = false
        secondAction.authenticationRequired = false
        
        
        // THIRD ACTION
        var thirdAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        thirdAction.identifier = "THIRD_ACTION"
        thirdAction.title = "Third Action"
        
        // This makes the firstAction a background activiation.
        thirdAction.activationMode = UIUserNotificationActivationMode.Background
        // Will warn user with a red background.
        thirdAction.destructive = false
        thirdAction.authenticationRequired = false
//
//        
//        
//        
//        // Categories
//        // ----------
//        

        var firstCategory:UIMutableUserNotificationCategory = UIMutableUserNotificationCategory()
        firstCategory.identifier = "FIRST_CATEGORY"
        
        let defaultActions:NSArray = [firstAction, secondAction, thirdAction]
        let minimalActions:NSArray = [firstAction, secondAction]
        
        firstCategory.setActions(defaultActions, forContext: UIUserNotificationActionContext.Default)
        firstCategory.setActions(minimalActions, forContext: UIUserNotificationActionContext.Minimal)
        
        // NSSet of all our categories
        
        let categories:NSSet = NSSet(objects: firstCategory)
        
        let types:UIUserNotificationType = UIUserNotificationType.Alert | UIUserNotificationType.Badge
        
        let mySettings:UIUserNotificationSettings = UIUserNotificationSettings(forTypes: types, categories: categories)
        
        UIApplication.sharedApplication().registerUserNotificationSettings(mySettings)
        
        // At this point the user will be prompted, and asked if they would like to allow the app to use notifications.
        // You can retest this in the simuator by resetting Xcode simulator settings.

        return true
    }
    
    func application(application: UIApplication!,
        handleActionWithIdentifier identifier:String!,
        forLocalNotification notification:UILocalNotification!,
        completionHandler: (() -> Void)!){
            
            if (identifier == "FIRST_ACTION"){
                
                NSNotificationCenter.defaultCenter().postNotificationName("actionOnePressed", object: nil)
                
            }else if (identifier == "SECOND_ACTION"){
                NSNotificationCenter.defaultCenter().postNotificationName("actionTwoPressed", object: nil)
                
            }
            
            completionHandler()
            
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



