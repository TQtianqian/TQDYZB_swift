//
//  HomeViewController.swift
//  TQDouYuZB
//
//  Created by worry on 2017/2/14.
//  Copyright © 2017年 worry. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //设置UI界面
        setupUI()
    
    }


}

//mark:-- 设置UI界面
extension HomeViewController{
    
     func setupUI(){
        //1.设置导航栏
        setupNavigationBar()
    }
    
    private func setupNavigationBar(){
        
        //1.设置左侧的item   
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        //2.设置右侧的item
        
        let size = CGSize(width: 40, height: 40)
/*类方法创建
        let historyItem = UIBarButtonItem.createItem(imageName: "viewHistoryIconHL", hightImageName: "viewHistoryIconHL", size: size)
        
        let searchItem = UIBarButtonItem.createItem(imageName: "searchBtnIconHL", hightImageName: "searchBtnIconHL", size: size)
        
        let qrcodeItem = UIBarButtonItem.createItem(imageName: "scanIconHL", hightImageName: "scanIconHL", size: size)
 */
        
        //构造函数创建
        let historyItem = UIBarButtonItem(imageName: "viewHistoryIconHL", hightImageName: "viewHistoryIconHL", size: size)
        let searchItem = UIBarButtonItem(imageName: "searchBtnIconHL", hightImageName: "searchBtnIconHL", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "scanIconHL", hightImageName: "scanIconHL", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
    
    }

}
