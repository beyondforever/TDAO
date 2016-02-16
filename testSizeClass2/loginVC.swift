//
//  login.swift
//  testSizeClass2
//
//  Created by JerryYang on 11/22/15.
//  Copyright (c) 2015 JerryYang. All rights reserved.
//

import Foundation

import UIKit

class loginVC: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var backGroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userNameTF.placeholder = "User Name"
        passwordTF.placeholder = "Password"
        userNameTF.keyboardType = UIKeyboardType.Default
        passwordTF.keyboardType = UIKeyboardType.Default
        
        var userNameIV:UIImageView = UIImageView(frame: CGRectMake(0, 0, userNameTF.frame.height*0.75, userNameTF.frame.height*0.75))
        userNameIV.image = UIImage(named: "icon01.png")
        var passwordIV:UIImageView = UIImageView(frame: CGRectMake(0, 0, passwordTF.frame.height*0.75, passwordTF.frame.height*0.75))
        passwordIV.image = UIImage(named: "icon02.png")
       
        userNameTF.leftView = userNameIV
        userNameTF.leftViewMode = UITextFieldViewMode.Always
        //passwordTF.leftView = UIImageView(image: UIImage(named: "icon02.png"))
        passwordTF.leftView = passwordIV
        passwordTF.leftViewMode = UITextFieldViewMode.Always
        
        //设置圆角按钮
        loginBtn.layer.cornerRadius = 5

        self.view.sendSubviewToBack(backGroundImage)
        
    }
    
    @IBAction func login(sender: UIButton) {
        if loginVerification() {
            //switch to Dashboard page
            self.performSegueWithIdentifier("DashBoard", sender: self)
        }
        else
        {
            println("Login Failed")
        }
        
    }

    //the func is to verify username/password
    //true - verification pass
    //false - verification doesn't pass
    /**
    the fund is to verify username/password
    
    :returns: Bool. true means verification pass
    */
    func loginVerification() -> Bool
    {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}