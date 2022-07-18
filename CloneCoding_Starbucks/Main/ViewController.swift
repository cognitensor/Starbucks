//
//  ViewController.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/06.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var viewOrderResult: UIView!
    @IBOutlet weak var imageViewOrderResult: UIImageView!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var viewStartApp: UIView!
    @IBOutlet weak var alphaHeaderView: UIView!
    
    //헤더뷰의 최대높이값과 최소높이값
    let maxHeight: CGFloat = 450.0
    let minHeight: CGFloat = 100.0


    @IBOutlet weak var mainTableView: UITableView!
    
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

        //그림자설정
        viewStartApp.layer.shadowOffset = CGSize(width: 1, height: 1)   //그림자 크기
        viewStartApp.layer.shadowOpacity = 0.2                          //그림자 투명도 0이 투명 1이 불투명
        viewStartApp.layer.shadowRadius = 2
//        viewStartApp.layer.shadowPath = UIBezierPath(rect: viewStartApp.bounds).cgPath
        
        imageViewOrderResult.layer.cornerRadius = imageViewOrderResult.frame.height/2
        
        //뷰 배경 블러효과
        viewOrderResult.layer.cornerRadius = 10
        viewBlur = UIVisualEffectView()
        viewBlur.effect = UIBlurEffect(style: .regular)
        viewBlur.layer.cornerRadius = 10
        viewBlur.clipsToBounds = true
//        //viewMain에 Blur 효과가 적용된 EffectView 추가
        viewOrderResult.addSubview(viewBlur)
        viewBlur.frame = CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.size.width)*0.97, height: 60)
        viewOrderResult.sendSubviewToBack(viewBlur)
        
        
        
        
        //테이블뷰에 셀 연결
        let tableViewCellHRNib = UINib(nibName: "TableViewCellHomeRecommend", bundle: nil)
        self.mainTableView.register(tableViewCellHRNib, forCellReuseIdentifier: "TableViewCellHomeRecommend")
        
        let tableViewCellHBNib = UINib(nibName: "TableViewCellHomeBanner", bundle: nil)
        self.mainTableView.register(tableViewCellHBNib, forCellReuseIdentifier: "TableViewCellHomeBanner")
        
        let tableViewCellHNNib = UINib(nibName: "TableViewCellHomeNew", bundle: nil)
        self.mainTableView.register(tableViewCellHNNib, forCellReuseIdentifier: "TableViewCellHomeNew")
        
        //테이블뷰 딜리게이트
        mainTableView.delegate = self
        mainTableView.dataSource = self
                
        
        //푸시알림권한요청 메서드 호출
        notificationPermission()

        
        
        //바텀뷰(결제결과창) 클릭이벤트
        let orderResultTapGesture = UITapGestureRecognizer(target: self, action: #selector(visibleOrderResult))
        viewOrderResult.addGestureRecognizer(orderResultTapGesture)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        
        //주문결과창 유무 호출 -다른 탭을 갔다 왔을 때 주문이 완료된 상태를 표현하기 위해 (다른 탭을 갔다 오면 willappear부터 진행되기떄문에)
        visibleOrderResult()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
        //주문 초기화
        UserDefaults.standard.set("주문 진행 전", forKey: "주문결과")
    }
    
    
    
    //MARK: 메서드:푸시알림권한요청
    func notificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow,Error in
            if didAllow {
                print("Push: 권한 허용")
            } else {
                print("Push: 권한 거부")
            }
        })
    }
    
    @objc func visibleOrderResult1() {
        print("zz")
    }
    
    //MARK: 주문결과창
    @objc func visibleOrderResult() {
        print(UserDefaults.standard.string(forKey: "주문결과") ?? "처음")

        if UserDefaults.standard.string(forKey: "주문결과") == "주문완료" {
            
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
    
}

//MARK: 테이블뷰 델리게이트
extension ViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollOffset = scrollView.contentOffset.y
        
        if headerViewHeight.constant >= maxHeight+scrollOffset {
            //처음 전체 탑배너가 보일때
            headerViewHeight.constant = maxHeight
            alphaHeaderView.isHidden = false
            
        } else if headerViewHeight.constant > minHeight+scrollOffset && headerViewHeight.constant < maxHeight+scrollOffset {
            //탑배너가 줄어들고 있을 때
            headerViewHeight.constant = headerViewHeight.constant - scrollOffset
            
            //점점 올라갈 수록 흐리게
            let persent = (headerViewHeight.constant)/400
            alphaHeaderView.alpha = persent
            alphaHeaderView.isHidden = false
            scrollView.contentOffset.y = 0
            
        } else {
            //탑배너가 최소 사이즈로 줄어들었을 때
            headerViewHeight.constant = minHeight
            alphaHeaderView.isHidden = true
        }
    }
}


//MARK: 테이블뷰 데이터소스
extension ViewController: UITableViewDataSource {

    //섹션의 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    //섹션마다 테이블뷰셀의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return homeBannerTop.count
            
        } else if section == 1 {
            return 1
        
        } else if section == 2 {
            return homeBannerGift.count
            
        } else if section == 3 {
            return 1
                    
        } else {
            return homeBannerBottom.count
        }
    }
    
    //섹션마다 불러올 셀에 대한 내용 할당
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0, 2, 4:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "TableViewCellHomeBanner", for: indexPath) as! TableViewCellHomeBanner
            
            if indexPath.section == 0 {
                cell.imageViewBanner.image = homeBannerTop[indexPath.row].bammerImage
                
            } else if indexPath.section == 2{
                cell.imageViewBanner.image = homeBannerGift[indexPath.row].bammerImage
                
            } else {
                cell.imageViewBanner.image = homeBannerBottom[indexPath.row].bammerImage
            }

            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "TableViewCellHomeNew", for: indexPath) as! TableViewCellHomeNew

            cell.config()
            
            cell.selectionStyle = .none
            return cell
            
        case 3:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "TableViewCellHomeRecommend", for: indexPath) as! TableViewCellHomeRecommend
            
            cell.collectionLabelTitle.text = "함께 하면 좋은 푸드 메뉴"
            
            cell.config()

            return cell

        default:
            return UITableViewCell()
        }
    }
    
    //섹션마다 불러올 셀에 대한 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return getRatio(tableView, homeBannerTop[indexPath.row].bammerImage)
            
        case 1:
            return 350
            
        case 2:
            return getRatio(tableView, homeBannerGift[indexPath.row].bammerImage)
            
        case 3:
            return 300
            
        case 4:
            return getRatio(tableView, homeBannerBottom[indexPath.row].bammerImage)
            
        default:
            return UITableView.automaticDimension
        }
    }
    
    //이미지 비율 구하기
    //원본이미지의 가로길이를 세로길이로 나누어 비율을 구한 후 테이블뷰의 너비에 나누어주어 높이비율을 구한다
    func getRatio(_ tableView: UITableView, _ image: UIImage) -> CGFloat {
        let widthRatio = CGFloat(image.size.width/image.size.height)
        return tableView.frame.width / widthRatio
    }
                                       
}

