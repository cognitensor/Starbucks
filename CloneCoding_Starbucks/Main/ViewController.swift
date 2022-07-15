//
//  ViewController.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/06.
//

import UIKit

class ViewController: UIViewController {
    
    var orderResult: String = ""
    
    @IBOutlet weak var viewOrderResult: UIView!
    @IBOutlet weak var imageViewOrderResult: UIImageView!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var viewStartApp: UIView!
    @IBOutlet weak var alphaHeaderView: UIView!
    
    //헤더뷰의 최대높이값과 최소높이값
    let maxHeight: CGFloat = 450.0
    let minHeight: CGFloat = 100.0


    @IBOutlet weak var mainScrollView: UIScrollView!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint! {
        didSet {
            headerViewHeight.constant = maxHeight
        }
    }

    
    
    var viewBlur: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        
        //탭바 윗줄 없애기
        self.tabBarController?.tabBar.clipsToBounds = true
        self.navigationController?.navigationBar.shadowImage = UIImage()

        
        
        //스크롤뷰 scrollViewDidScroll 연결
        mainScrollView.delegate = self
        
        //그림자설정
        viewStartApp.layer.shadowOffset = CGSize(width: 1, height: 2)   //그림자 크기
        viewStartApp.layer.shadowOpacity = 0.15                          //그림자 투명도 0이 투명 1이 불투명
        viewStartApp.layer.shadowRadius = 3
        
        
        imageViewOrderResult.layer.cornerRadius = imageViewOrderResult.frame.height/2
        
        //푸시알림권한요청함수 호출
        notificationPermission()
        
        
        //뷰 배경 블러효과
        viewBlur = UIVisualEffectView()
        viewBlur.effect = UIBlurEffect(style: .regular)
        //viewMain에 Blur 효과가 적용된 EffectView 추가
        viewOrderResult.addSubview(viewBlur)
        viewBlur.frame = viewOrderResult.bounds
        viewOrderResult.sendSubviewToBack(viewBlur)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        if orderResult == "주문완료" {
            //스토리보드의 이름으로 스토리보드 연결
            let storyboardOrder = UIStoryboard(name: "StoryboardOrder", bundle: nil)
            //스토리보드와 ViewController파일 연결
            let ViewControllerOrderPayResult = storyboardOrder.instantiateViewController(withIdentifier: "ViewControllerOrderPayResult") as! ViewControllerOrderPayResult

            imageViewOrderResult.image = UIImage(named: UserDefaults.standard.string(forKey: "MenuImage")!)
            viewOrderResult.isHidden = false

            ViewControllerOrderPayResult.modalPresentationStyle = .formSheet
            self.present(ViewControllerOrderPayResult, animated: true, completion: nil)
        } else {
            viewOrderResult.isHidden = true
        }
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
    
    
    
    //MARK: 함수:푸시알림권한요청
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

//MARK: 메인 뷰 스크롤할 때
extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let scrollOffset = scrollView.contentOffset.y
//        print(scrollOffset)
        
        if headerViewHeight.constant >= maxHeight+scrollOffset {
            //처음 전체 탑배너가 보일때
//            print("1")
            headerViewHeight.constant = maxHeight
            alphaHeaderView.isHidden = false
            
        } else if headerViewHeight.constant > minHeight+scrollOffset && headerViewHeight.constant < maxHeight+scrollOffset {
            //탑배너가 줄어들고 있을 때
//            print("2")
            headerViewHeight.constant = headerViewHeight.constant - scrollOffset
            
            
            
            //점점 올라갈 수록 흐리게
            let persent = (headerViewHeight.constant)/400
            alphaHeaderView.alpha = persent
            alphaHeaderView.isHidden = false
            scrollView.contentOffset.y = 0
        } else {
            //탑배너가 최소 사이즈로 줄어들었을 때
//            print("3")
            headerViewHeight.constant = minHeight
            alphaHeaderView.isHidden = true
        }
    }

}
