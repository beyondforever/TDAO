//
//  ViewController.swift
//  testSizeClass2
//
//  Created by JerryYang on 11/19/15.
//  Copyright (c) 2015 JerryYang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var verticalLineUIView: UIView!
    @IBOutlet weak var containerUIView: UIView!
    @IBOutlet weak var centerBaseBtn: UIButton!
    @IBOutlet weak var leftUpBtn: UIButton!
    @IBOutlet weak var lefUpLabel1: UILabel!
    @IBOutlet weak var rightUpBtn: UIButton!
    @IBOutlet weak var rightUpLabel: UILabel!
    @IBOutlet weak var leftDownImage: UIImageView!
    @IBOutlet weak var rightDownImage: UIImageView!
    
    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var centerImage: UIImageView!
    
    var btnT2:CButCus = CButCus((frame: CGRect(x: 0, y: 0, width: 101, height: 102)))   //define center button
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Alliance Test Drive Center"
        self.navigationController?.navigationBar.titleTextAttributes = NSDictionary(object: UIColor.whiteColor(), forKey: NSForegroundColorAttributeName) as [NSObject : AnyObject]
        self.navigationController?.navigationBar.barTintColor = colorFromHexString("#0298d7")

        containerUIView.addSubview(verticalLineUIView)
        containerUIView.addSubview(leftUpBtn)
        containerUIView.addSubview(centerBaseBtn)
        
        //var btnT2:CButCus = CButCus((frame: CGRect(x: 0, y: 0, width: centerBaseBtn.frame.height, height: centerBaseBtn.frame.height)))
        /*btnT2.backgroundColor = UIColor.whiteColor() //blackColor()
        //btnT2.setTitle("BtnT2Cus", forState: UIControlState.Normal)
        //btnT2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        let shapeT2:CAShapeLayer = CAShapeLayer()
        let bepathT2:UIBezierPath = UIBezierPath(ovalInRect: btnT2.bounds)
        shapeT2.path = bepathT2.CGPath
        shapeT2.lineWidth = 1
        //shapeT2.strokeColor = UIColor.greenColor().CGColor
        shapeT2.strokeColor = colorFromHexString("#0298d7").CGColor
        shapeT2.fillColor = UIColor.whiteColor().CGColor
        btnT2.layer.addSublayer(shapeT2)*/
        
        containerUIView.addSubview(btnT2)

        //add click event in butT2
        btnT2.addTarget(self,action:Selector("tapped"),forControlEvents:.TouchUpInside)
        
        containerUIView.setTranslatesAutoresizingMaskIntoConstraints(false) //remember to add this code when add constraint
        btnT2.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        containerUIView.addConstraint(NSLayoutConstraint(item: btnT2, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: containerUIView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        containerUIView.addConstraint(NSLayoutConstraint(item: btnT2, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: containerUIView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        containerUIView.addConstraint(NSLayoutConstraint(item: btnT2, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: centerBaseBtn, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
        containerUIView.addConstraint(NSLayoutConstraint(item: btnT2, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: btnT2, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))

        
        /*println("after autolayout, the containerUIView X info: \(containerUIView.frame.origin.x)")
        println("after autolayout, the centerBaseBtn Y info: \(containerUIView.frame.origin.y)")
        println("after autolayout, the centerBaseBtn X info: \(centerBaseBtn.frame.origin.x)")
        println("after autolayout, the centerBaseBtn Y info: \(centerBaseBtn.frame.origin.y)")
        println("after autolayout, the btnT2 X info: \(btnT2.frame.origin.x)")
        println("after autolayout, the btnT2 Y info: \(btnT2.frame.origin.y)")
        println("after autolayout, the leftUpBtn width info: \(leftUpBtn.bounds.width)")
        println("after autolayout, the leftUpBtn height info: \(leftUpBtn.bounds.height)")
        println("after autolayout, the centerBaseBtn width info: \(centerBaseBtn.bounds.width)")
        println("after autolayout, the centerBaseBtn height info: \(centerBaseBtn.bounds.height)")
        println("after autolayout, the btnT2 width info: \(btnT2.bounds.width)")
        println("after autolayout, the btnT2 width info: \(btnT2.bounds.height)")*/

        lefUpLabel1.adjustsFontSizeToFitWidth = true
        rightUpLabel.adjustsFontSizeToFitWidth = true
        containerUIView.bringSubviewToFront(lefUpLabel1)
        containerUIView.bringSubviewToFront(rightUpLabel)
        containerUIView.bringSubviewToFront(leftDownImage)
        containerUIView.bringSubviewToFront(rightDownImage)
        containerUIView.bringSubviewToFront(centerImage)
        containerUIView.bringSubviewToFront(centerLabel)
        
    }

    override func viewDidAppear(animated: Bool) {
        //给定制按钮画圆。画圆的动作不能在viewDidLoad中去做，而要到加载结束后再进行。
        btnT2.backgroundColor = UIColor.whiteColor()
        let shapeT2:CAShapeLayer = CAShapeLayer()
        let bepathT2:UIBezierPath = UIBezierPath(ovalInRect: btnT2.bounds)
        shapeT2.path = bepathT2.CGPath
        shapeT2.lineWidth = 1
        shapeT2.strokeColor = colorFromHexString("#0298d7").CGColor
        shapeT2.fillColor = UIColor.whiteColor().CGColor
        btnT2.layer.addSublayer(shapeT2)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /**
    this is the click event after user click "Request Service", will swith to ServiceList page to choose service
    
    :param: no param
    :returns: no return
    */

        func tapped(){
        print("tapped")
        let board:UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        let rsVC = board.instantiateViewControllerWithIdentifier("RequestService") as! UIViewController
        self.navigationController?.pushViewController(rsVC, animated: true)
    }


}

