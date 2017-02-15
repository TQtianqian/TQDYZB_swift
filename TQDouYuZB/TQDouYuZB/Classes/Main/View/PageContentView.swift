//
//  PageContentView.swift
//  TQDouYuZB
//
//  Created by worry on 2017/2/15.
//  Copyright © 2017年 worry. All rights reserved.
//

import UIKit

private let ContentCellID = "ContentCellID"

class PageContentView: UIView {

    //mark:--定义属性
     var  childVC : [UIViewController]
     weak var  parentVC : UIViewController?
    
    //mark:--懒加载属性
    lazy var collectionView : UICollectionView = {[weak self] in
    
        //1.创建layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        //2.创建UICollectionView
        let collectionView = UICollectionView(frame: (self?.bounds)!, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces  = false
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier:ContentCellID)
        
        return collectionView
        
    }()
    
    //mark:--自定义构造函数
    init(frame: CGRect,childVC:[UIViewController],parentViewController:UIViewController?) {
        self.childVC = childVC
        self.parentVC = parentViewController
        
        super.init(frame: frame)
        
        //设置UI
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//mark:--设置UI界面
extension PageContentView{

    func setupUI(){
    
        //1.将所有子控制器添加到父控制器中
        for childViewContrl in childVC{
        
            parentVC? .addChildViewController(childViewContrl)
            
        }
        
        //2.添加UICollectionView，用于在cell中存放控制器的View
        addSubview(collectionView)
        collectionView.frame = bounds
    
    }

}

//mark:--遵守UICollectionDataSource
extension PageContentView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVC.count
    }
    
    func  collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1.创建cell
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCellID, for: indexPath)
    
    
        //2.给cell设置内容
        for view in cell.contentView.subviews{
            view .removeFromSuperview()
        }
        
        let childViewCtrl = childVC[indexPath.item]
        childViewCtrl.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childViewCtrl.view)
        
        return cell
    }
    
    

}

//mark:--对外暴露的方法
extension PageContentView{
    func setCurrentIndex(currentIndex :Int) {
        let offSetX = CGFloat(currentIndex) * collectionView.frame.width
        collectionView.setContentOffset(CGPoint(x:offSetX,y:0), animated: false)
        
    }
}










