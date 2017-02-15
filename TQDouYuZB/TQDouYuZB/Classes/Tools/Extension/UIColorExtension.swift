
//
//  UIColorExtension.swift
//  TQDouYuZB
//
//  Created by worry on 2017/2/15.
//  Copyright © 2017年 worry. All rights reserved.
//

import UIKit

extension UIColor{

    convenience init(r:CGFloat,g:CGFloat,b:CGFloat) {
        self.init(red : r / 255.0,green: g / 255.0,blue: b / 255.0,alpha : 1.0)
    }
    
}
