//
//  ViewController.swift
//  BloodDonorDemo1
//
//  Created by cse on 12/8/19.
//  Copyright © 2019 Kuet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func UserPageTapped(_ sender: UIButton) {
        //User Page
        self.performSegue(withIdentifier: "userhome", sender: self);
        
    }

    @IBAction func DonorPage(_ sender: UIButton) {
        //Donor Page
        self.performSegue(withIdentifier: "donorlogin", sender: self);
    }
}

