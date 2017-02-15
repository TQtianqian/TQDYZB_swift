//
//  PageTitleView.swift
//  TQDouYuZB
//
//  Created by worry on 2017/2/15.
//  Copyright © 2017年 worry. All rights reserved.
//

import UIKit


protocol PageTitleViewDelegate : class {
    func pageTitleView(titleView:PageTitleView,selectedIndex index :Int)
    
}

private let kScrollViewLineH : CGFloat = 2

class PageTitleView: UIView {

    //Mark:-定义属性
    var currentIndex : Int = 0
    var titles:[String]
    weak var delegate : PageTitleViewDelegate?
    
    //mark:--懒加载属性
    lazy var titleLabel : [UILabel] = [UILabel]()
    
    
    lazy var scrollView : UIScrollView = {
    
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.isPagingEnabled = false
        scrollView.bounces = false
        return scrollView
    }()
    
    lazy var scrollLine : UIView = {
    
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        
        return scrollLine
    
    }()
    
    //Mark:-自定义构造函数
    init(frame: CGRect,titles:[String]) {
        self.titles = titles
        
        super.init(frame: frame)
        
        //设置UI界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//mark:--设置UI界面
extension PageTitleView{

    func setupUI(){
        //1.添加UIScrollView
        addSubview(scrollView)
        
        scrollView.frame = bounds
        
        //2.添加title对应的label
        setupTitleLabel()
        
        //3.设置底线和滚动的滑块
        setupBottomMenuAndScrollLine()
        
        
    }
    
    
    private func setupTitleLabel(){
        
        //0.确定label的一些frame值
        let labelW : CGFloat = frame.width / CGFloat(titles.count)
        let labelH : CGFloat = frame.height - kScrollViewLineH
        let labelY : CGFloat = 0
    
        for (index,title) in titles.enumerated(){
        
            //1.创建UILabel
            let label = UILabel()
            
            //2.设置label的属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            
            //3.设置label的frame
            let labelX : CGFloat = labelW * CGFloat(index)
            
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            //4.将label添加到scrollView中
            scrollView.addSubview(label)
            titleLabel.append(label)
        
            //5.给label添加手势
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLabelClick(tapGes:)))
            
            label.addGestureRecognizer(tapGes)
            
        }
    
    }
    
    private func setupBottomMenuAndScrollLine(){
        //1.添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)

        addSubview(bottomLine)
        
        //2.添加scrollLine
        //2.1获取第一个label
        guard let firstLabel = titleLabel.first else{return}
        firstLabel.textColor = UIColor.orange
        
        //2.2设置scrollView的属性
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollViewLineH, width: firstLabel.frame.width, height: kScrollViewLineH)
    
    }
}


//mark:--监听label的点击
extension PageTitleView{

    @objc func titleLabelClick(tapGes:UITapGestureRecognizer){

        //1.获取当前label的下标值
        guard let currentLabel = tapGes.view as? UILabel else {return}
        
        //2.获取之前的label
        let oldLabel = titleLabel[currentIndex]
        
        //3.切换文字的颜色
        currentLabel.textColor = UIColor.orange
        oldLabel.textColor = UIColor.darkGray
        
        //4.滚动条位置发生改变
        let scrollLineX = CGFloat(currentLabel.tag) * scrollLine.frame.width
        
        UIView.animate(withDuration: 0.15) { 
            self.scrollLine.frame.origin.x = scrollLineX
        }
        
        //5.保存最新label的下标值
        currentIndex = currentLabel.tag
        
        //6.通知代理
        delegate?.pageTitleView(titleView: self, selectedIndex: currentIndex)
        
        
    }
    
}

















