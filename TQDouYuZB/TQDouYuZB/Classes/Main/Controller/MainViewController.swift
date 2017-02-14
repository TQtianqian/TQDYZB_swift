//
//  MainViewController.swift
//  TQDouYuZB
//
//  Created by worry on 2017/2/14.
//  Copyright © 2017年 worry. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVC(storyName: "Home")
        addChildVC(storyName: "Live")
        addChildVC(storyName: "Follow")
        addChildVC(storyName: "Profile")

    }

    
    private func addChildVC(storyName:String){
        
        //1.通过storyboard获取控制器
        
        let childVC = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()
        
        //2.将childvc作为子控制器
        addChildViewController(childVC!)
    
    }

}
