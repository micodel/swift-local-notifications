//
//  ViewController.swift
//  swift local notifications
//
//  Created by Michael Hamel on 8/3/14.
//  Copyright (c) 2014 Michael Hamel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"drawAShape:", name: "actionOnePressed", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"showAMessage:", name: "actionTwoPressed", object: nil)
        
        // Sets fire date for notification.
        var dateComp:NSDateComponents = NSDateComponents()
        dateComp.year = 2014;
        dateComp.month = 08;
        dateComp.day = 05;
        dateComp.hour = 3;
        dateComp.minute = 50;
        dateComp.timeZone = NSTimeZone.systemTimeZone()
        
        // Tells app to execute the fire date based on the internal device date, which is assumed to be utitilzing a Gregorian calandar.
        var deviceCalendar:NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        var date:NSDate = deviceCalendar.dateFromComponents(dateComp)
        
        // Initialized local notification.
        var notification:UILocalNotification = UILocalNotification()
        // Will use one of the three actions in category depending on how its presented.
        notification.category = "FIRST_CATEGORY"
        notification.alertBody = "Hi, I am a notification"
        notification.fireDate = date
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    
    
    func drawAShape(notification:NSNotification){
        var view:UIView = UIView(frame:CGRectMake(10, 10, 100, 100))
        view.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(view)
        
    }
    
    func showAMessage(notification:NSNotification){
        var message:UIAlertController = UIAlertController(title: "A Notification Message", message: "Hello there", preferredStyle: UIAlertControllerStyle.Alert)
        message.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(message, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}







