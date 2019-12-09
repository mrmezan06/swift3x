//
//  DonorLoginViewController.swift
//  BloodDonorDemo1
//
//  Created by cse on 12/8/19.
//  Copyright © 2019 Kuet. All rights reserved.
//

import UIKit

class DonorLoginViewController: UIViewController {

    @IBOutlet weak var userphoneField: UITextField!
    @IBOutlet weak var userpasswordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func LoginTapped(_ sender: UIButton) {
        
        let userphone = userphoneField.text;
        let password = userpasswordField.text;
        
        /*
        let urlname = "http://carrent01.000webhostapp.com/reginfojson.php";
        let dataUrl = URL(string: urlname)!
        let task = URLSession.shared.dataTask(with: dataUrl)
        {(data,response,error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return
            }
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                
                //print(jsonResponse)
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                print(jsonArray)
                
                //let donar_name = Name.text;
                // guard let name = jsonArray[0]["name"] as? String else { return }
                // print(name)
                
                for dic in jsonArray{
                    guard let phone = dic["phone"] as? String else { return }
                    guard let pass = dic["password"] as? String else { return }
                    print(phone)
                    print(pass)
                    print(userphone!)
                    print(password!)
                    
                    
                    
                    if (userphone == phone && password == pass){
                        
                       // self.loginSuccess();
                        
                        
                    }
                    
                    
                }
                
            }catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
        
        
        if ((userphone == "12345601" && password == "1234") || (userphone == "123" && password == "123") || (userphone == "01786995549" && password == "1234")) {
            loginSuccess();
        }else{
            loginError();
        }
        */
        
       let dbUser =  UserDefaults.standard.string(forKey: "userPhone");
       let dbPass =  UserDefaults.standard.string(forKey: "userPassword");
        
        if (userphone == dbUser && password == dbPass) {
            loginSuccess();
           // performSegue(withIdentifier: "donorhome", sender: self);
        }else{
            loginError();
        }
        
        

        
        
    }
    @IBAction func RegisterTapped(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "register", sender: self);
        
    }
    
    func loginSuccess(){
    
        let mAlert = UIAlertController(title:"Info", message:"Login Successful", preferredStyle: UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ action in
            //self.dismiss(animated: true, completion: nil);
            self.performSegue(withIdentifier: "donorhome", sender: self)
            
        }
        mAlert.addAction(okAction);
        self.present(mAlert, animated: true, completion: nil);

    }
    
    func loginError(){
        
        let mAlert = UIAlertController(title: "Info", message: "Wrong Phone or Password!", preferredStyle: UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        mAlert.addAction(okAction);
        self.present(mAlert,animated: true);
        
    }
    
}
