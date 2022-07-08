//
//  ViewController.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/06.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var alphaHeaderView: UIView!
    @IBOutlet weak var viewStartApp: UIView!
    @IBOutlet weak var viewHeaderBottom: UIView!
    
    //헤더뷰의 최대높이값과 최소높이값
    let maxHeight = (UIScreen.main.bounds.size.height)/2
    let minHeight: CGFloat = 50.0

    @IBOutlet weak var mainScrollView: UIScrollView! {
        didSet {
            mainScrollView.contentInset = UIEdgeInsets(top: maxHeight, left: 0, bottom: 0, right: 0)
        }
    }
        
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint! {
        didSet {
            headerViewHeight.constant = maxHeight
        }
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset.y)
        let scrollOffset = scrollView.contentOffset.y
        if scrollOffset > -maxHeight && scrollOffset < -48{
            headerView.transform = CGAffineTransform(translationX: 0, y:abs(scrollOffset)-maxHeight)
            
            let persent = (-scrollOffset-100)/50
            alphaHeaderView.alpha = persent
        }
      }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        //스크롤뷰 scrollViewDidScroll 연결
        mainScrollView.delegate = self
        
        //그림자설정
        viewStartApp.layer.shadowOffset = CGSize(width: 2, height: 3)   //그림자 크기
        viewStartApp.layer.shadowOpacity = 0.15                          //그림자 투명도 0이 투명 1이 불투명
        viewStartApp.layer.shadowRadius = 5
        
        
        //푸시알림권한요청함수 호출
        notificationPermission()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    
    
    
    //푸시알림권한요청
    func notificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow,Error in
            if didAllow {
                print("Push: 권한 허용")
            } else {
                print("Push: 권한 거부")
            }
        })
    }
}

 
