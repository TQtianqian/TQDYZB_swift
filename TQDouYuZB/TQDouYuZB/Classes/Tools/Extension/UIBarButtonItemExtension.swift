//
//  UIBarButtonItemExtension.swift
//  TQDouYuZB
//
//  Created by worry on 2017/2/14.
//  Copyright © 2017年 worry. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    //类方法
    /*
    class func createItem(imageName:String,hightImageName:String,size:CGSize) -> UIBarButtonItem{
    
        let btn = UIButton()
        
        btn.setImage(UIImage(named:imageName), for: .normal)
        btn.setImage(UIImage(named:hightImageName), for: .highlighted)
        
        btn.frame = CGRect(origin: CGPoint(), size: size)
        
        return UIBarButtonItem(customView: btn)
    }*/
    
    //便利构造函数 1>以convenience开头 2>在构造函数中必须明确调用一个设计的构造函数
    convenience init(imageName:String,hightImageName:String = "" ,size:CGSize = CGSize()) {
        //1.创建UIButton
        let btn = UIButton()
        
        //2.设置button的图片
        btn.setImage(UIImage(named:imageName), for: .normal)
        
        if hightImageName != "" {
            btn.setImage(UIImage(named:hightImageName), for: .highlighted)
        }
        
        //3.设置button的尺寸
        if size == CGSize() {
            btn.sizeToFit()
        }else{
            btn.frame = CGRect(origin: CGPoint(), size: size)
        }
        
        
        self.init(customView:btn)
    }
    


}
