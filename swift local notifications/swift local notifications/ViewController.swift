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
        
        var dateComp:NSDateComponents = NSDateComponents()
        dateComp.year = 2014;
        dateComp.month = 08;
        dateComp.day = 05;
        dateComp.hour = 2;
        dateComp.minute = 45;
        dateComp.timeZone = NSTimeZone.systemTimeZone()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

