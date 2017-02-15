//
//  HomeViewController.swift
//  TQDouYuZB
//
//  Created by worry on 2017/2/14.
//  Copyright © 2017年 worry. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {


    //mark:--懒加载属性
    lazy var pageTitleView : PageTitleView = {[weak self] in
        
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
    
        let titles = ["推荐","游戏","娱乐","趣玩"]
        
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
//        titleView.backgroundColor = UIColor.purpl
        
        titleView.delegate = self
        
        return titleView
    
    }()
    
    
    lazy var pageContentView : PageContentView = {[weak self] in
    
        //1.确定内容的frame
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        
        //2.确定所有的子控制器
        var childVC = [UIViewController]()
        for _ in 0..<4{
        
            let vc = UIViewController()
            
            vc.view.backgroundColor = UIColor(r:CGFloat( arc4random_uniform(255)), g: CGFloat( arc4random_uniform(255)), b: CGFloat( arc4random_uniform(255)))
            
            childVC.append(vc)
            
        }
        
        let contentView = PageContentView(frame: contentFrame, childVC: childVC, parentViewController: self)
    
        return contentView
    }()
    
    //系统回掉函数
    override func viewDidLoad() {
        super.viewDidLoad()

        //设置UI界面
        setupUI()
    
    }


}

//mark:-- 设置UI界面
extension HomeViewController{
    
     func setupUI(){
        //0.不需要调整uiscrollView的内边距
        automaticallyAdjustsScrollViewInsets  = false
        
        //1.设置导航栏
        setupNavigationBar()
        
        //2.添加titleView
        view.addSubview(pageTitleView)
        
        //3.添加contentView
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.purple
        
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
        let historyItem = UIBarButtonItem(imageName: "viewHistoryIconHL", hightImageName: "viewHistoryIcon", size: size)
        let searchItem = UIBarButtonItem(imageName: "searchBtnIconHL", hightImageName: "searchBtnIcon", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "scanIconHL", hightImageName: "scanIcon", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
    
    }

}

//mark:--遵守PageTitleDelegate
extension HomeViewController : PageTitleViewDelegate{
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int) {

        pageContentView.setCurrentIndex(currentIndex: index)
    
    }

}










