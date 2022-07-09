//
//  ViewControllerOrder.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/06.
//

import UIKit

class ViewController3Order: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let titleImageArray = ["order_1new", "order_2recommend", "order_3reserve", "order_4drip", "order_5refreshers", "order_6coldbrew", "order_7blonde", "order_8espresso", "order_9decaf", "order_10frappuccino", "order_11blended", "order_12fizzio", "order_13tevana", "order_14brewed", "order_15others", "order_16rtd"]
    let titleArray = ["NEW", "추천", "리저브 에스프레소", "리저브 드립", "리프레서", "콜드브루", "블론드", "에스프레소", "디카페인 커피", "프라푸치노", "블렌디드", "피지오", "티바나", "브루드 커피", "기타", "병음료"]
    let subTitleArray = ["", "Recommend", "Reserve Espresso", "Reserve Drip", "Starbucks Refreshers", "Cold Brew", "Blonde Coffee", "Espresso", "Decaf Coffee", "Frappuccino", "Blended", "Starbucks Fizzio", "Teavana", "Brewed Coffee", "Others", "RTD"]
    
    
    let maxHeight: CGFloat = 200.0
    let minHeight: CGFloat = 150.0
    
    @IBOutlet weak var tableView3Order: UITableView! {
        didSet {
            tableView3Order.contentInset = UIEdgeInsets(top: maxHeight+10, left: 0, bottom: 0, right: 0)
        }
    }
    
    @IBOutlet weak var orderMainHeaderViewHeight: NSLayoutConstraint! {
        didSet {
            orderMainHeaderViewHeight.constant = maxHeight
        }
    }
    
    @IBOutlet weak var naviBarOrder: UINavigationBar!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var viewOrderHeader: UIView!
    @IBOutlet weak var viewBigTitle: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad 3rd")
        
        //탭바 윗줄 없애기
        self.tabBarController?.tabBar.clipsToBounds = true
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        //네비게이션 밑줄 없애기
        naviBarOrder.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        naviBarOrder.shadowImage = UIImage()
        
        
        //뷰 그림자 넣기 (그림자공간줘야함, 배경색흰색으로 안하면 안에있는 컴포넌트들 그림자 생김)
        view3.layer.shadowOffset = CGSize(width: 0, height: 2)   //그림자 크기
        view3.layer.shadowOpacity = 0.15                          //그림자 투명도 0이 투명 1이 불투명
        view3.layer.shadowRadius = 2  //번지는정도 (0일때 선, 높을 수록 번짐)
        
        view4.layer.shadowOffset = CGSize(width: 0, height: 1)   //그림자 크기
        view4.layer.shadowOpacity = 0.05                          //그림자 투명도 0이 투명 1이 불투명
        view4.layer.shadowRadius = 0  //번지는정도 (0일때 선, 높을 수록 번짐)
        
        //셀리소스파일 가져오기
        let tableViewCellNib = UINib(nibName: "TableViewCell3Order", bundle: nil)
        
        //셀가져온 리소스 등록
        self.tableView3Order.register(tableViewCellNib, forCellReuseIdentifier: "TableViewCell3Order")
        
//        self.tableView3Order.rowHeight = UITableView.automaticDimension
        self.tableView3Order.rowHeight = 90
        
        //****아주 중요****
        self.tableView3Order.delegate = self
        self.tableView3Order.dataSource = self
        
        print("count : \(titleArray.count)")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear 3rd")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear 3rd")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear 3rd")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear 3rd")
    }
    
    
    
    @IBOutlet weak var naviTitle: UINavigationItem!
    //--UITableViewDelegate--
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
        let scrollOffset = scrollView.contentOffset.y
//        print(scrollOffset)
        
        if scrollOffset <= -maxHeight {
            
            //라지타이틀 생기게하기
            naviTitle.largeTitleDisplayMode = .always
            
        } else if scrollOffset > -maxHeight && scrollOffset < -145 {

            viewOrderHeader.transform = CGAffineTransform(translationX: 0, y: abs(scrollOffset)-maxHeight)
            
            //라지타이틀 없애기
            naviTitle.largeTitleDisplayMode = .never
            
        } else {
            naviTitle.largeTitleDisplayMode = .never
        }
        
    }
    
    
    
    
    //--UITableViewDataSource--
    //테이블 뷰 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray.count
    }
    
    //각 셀에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //셀 파일이랑 연결시키기
        let cell = tableView3Order.dequeueReusableCell(withIdentifier: "TableViewCell3Order", for: indexPath) as! TableViewCell3Order
    
        
        //셀 내용넣기
        cell.orderTitleLabel.text = titleArray[indexPath.row]
        cell.orderTitleImage.image = UIImage(named: titleImageArray[indexPath.row])
        
        if indexPath.row == 0 {
            cell.orderSubTitleLabel.isHidden = true
        } else {
            cell.orderSubTitleLabel.text = subTitleArray[indexPath.row]
        }
        
        //클릭했을 때 배경이 회색으로 변하는 거 없애기
        cell.selectionStyle = .none
        
        
        return cell
    }
    
    //셀 클릭시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //스토리보드의 이름으로 스토리보드 연결
        let storyboardOrder = UIStoryboard(name: "StoryboardOrder", bundle: nil)
        //스토리보드와 ViewController파일 연결
        let ViewControllerOrder1Menu = storyboardOrder.instantiateViewController(withIdentifier: "ViewControllerOrder1Menu") as! ViewControllerOrder1Menu

        ViewControllerOrder1Menu.modalPresentationStyle = .fullScreen
        self.present(ViewControllerOrder1Menu, animated: true, completion: nil)
        
    }
    
}



//UILabel 자간 설정하는 클래스
open class CustomLabel : UILabel {
    @IBInspectable open var characterSpacing:CGFloat = 1 {
        didSet {
            let attributedString = NSMutableAttributedString(string: self.text!)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: self.characterSpacing, range: NSRange(location: 0, length: attributedString.length))
            self.attributedText = attributedString
        }

    }
}
