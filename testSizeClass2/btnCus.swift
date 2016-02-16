//
//  btnCus.swift
//  ggg
//
//  Created by JerryYang on 10/17/15.
//  Copyright (c) 2015 JerryYang. All rights reserved.
//

import Foundation
import UIKit

class CButCus: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        /*//绘制一个圆形path
        let shapeT2:CAShapeLayer = CAShapeLayer()
        let bepathT2:UIBezierPath = UIBezierPath(ovalInRect: self.bounds)
        shapeT2.path = bepathT2.CGPath
        shapeT2.lineWidth = 1
        shapeT2.strokeColor = UIColor.blueColor().CGColor
        //shapeT2.fillColor = UIColor.whiteColor().CGColor
        self.layer.addSublayer(shapeT2)
        println("init: self.bounds.width:\(self.bounds.width)")
        println("init: self.bounds.height:\(self.bounds.height)")*/

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool{
        //首先调用父类的方法确定点击的区域确实在按钮的区域中
        var res = super.pointInside(point, withEvent: event)
        if (res) {
            //绘制一个圆形path
            let bepathT:UIBezierPath = UIBezierPath(ovalInRect: self.bounds)
            
            //println("self.bounds.width:\(self.bounds.width)")
            //println("self.bounds.height:\(self.bounds.height)")
            if bepathT.containsPoint(point){
                //如果在path区域内，返回YES
                return true;
            }
        }
        return false;
    }
}