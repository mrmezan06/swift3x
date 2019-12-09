//
//  RegisterViewController.swift
//  BloodDonorDemo1
//
//  Created by cse on 12/8/19.
//  Copyright © 2019 Kuet. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var bloodField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        
        let name = nameField.text;
        let phone = phoneField.text;
        let blood = bloodField.text;
        let city = cityField.text;
        let password = passwordField.text;
        
        
        if (name!.isEmpty || phone!.isEmpty || blood!.isEmpty || city!.isEmpty || password!.isEmpty) {
            displayMyAlert(uMsg: "All fields are required!")
            return;
        }
        UserDefaults.standard.set(phone, forKey: "userPhone");
        UserDefaults.standard.set(password, forKey: "userPassword");
        UserDefaults.standard.synchronize();
        
       // displayMyAlert(uMsg: "Registration Successful!Back To Login Page!");
        sendtoServer();
        displayMyAlert(uMsg: "Registration Successful!Back To Login Page!");
        
        
    }
    @IBAction func LoginBackTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "backlogin", sender: self);
    }
    
    func displayMyAlert(uMsg:String) {
        let mAlert = UIAlertController(title:"info", message:uMsg, preferredStyle: UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil);
        mAlert.addAction(okAction);
        self.present(mAlert, animated:true, completion:nil);
    }
    func sendtoServer(){
        var urlname = "http://carrent01.000webhostapp.com/registration.php?name="
        urlname += nameField.text!
        urlname += "&phone="
        urlname += phoneField.text!
        urlname += "&gender="
        urlname += "FM"
        urlname += "&blood="
        urlname += bloodField.text!
        urlname += "&city="
        urlname += cityField.text!
        urlname += "&password="
        urlname += passwordField.text!
        
        
        
        
        let dataUrl = URL(string: urlname)!
        
        let task = URLSession.shared.dataTask(with: dataUrl)
        {(data,response,error) in
            if error == nil {
                if let returnData = String(data: data!, encoding: .utf8) {
                    print(returnData)
                    //self.displayMyAlert(uMsg: returnData);
                    //return;
                   // self.displayMyAlert(uMsg: returnData);
                } else {
                    print("error");
                   //self.displayMyAlert(uMsg: "Error to respond server!");
                  //  return;
                }
             }
        }
        task.resume();

    }


}
