//
//  ViewController.swift
//  UrbanAirshipTest
//
//  Created by Breathometer on 6/20/16.
//  Copyright © 2016 KevinHou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ManuelAlert: UIButton!
    
    @IBAction func triggerAlert(sender: AnyObject) {
        let alertController = UIAlertController(title: "iOScreator", message:
            "Hello, world!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))  // Set button option 
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

