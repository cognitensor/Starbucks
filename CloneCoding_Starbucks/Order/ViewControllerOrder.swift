//
//  ViewControllerOrder.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/06.
//

import UIKit

class ViewControllerOrder: UIViewController {
    
    let titleImageArray = ["order_1new", "order_2recommend", "order_3reserve", "order_4drip", "order_5refreshers", "order_6coldbrew", "order_7blonde", "order_8espresso", "order_9decaf", "order_10frappuccino", "order_11blended", "order_12fizzio", "order_13tevana", "order_14brewed", "order_15others", "order_16rtd"]
    let titleArray = ["NEW", "추천", "리저브 에스프레소", "리저브 드립", "리프레서", "콜드브루", "블론드", "에스프레소", "디카페인 커피", "프라푸치노", "블렌디드", "피지오", "티바나", "브루드 커피", "기타", "병음료"]
    let subTitleArray = ["", "Recommend", "Reserve Espresso", "Reserve Drip", "Starbucks Refreshers", "Cold Brew", "Blonde Coffee", "Espresso", "Decaf Coffee", "Frappuccino", "Blended", "Starbucks Fizzio", "Teavana", "Brewed Coffee", "Others", "RTD"]

    var resultSelectedTitle: String = ""
    var resultSelectedSubTitle: String = ""
    var resultSelectedTitleImage: String = ""
    
    @IBOutlet weak var tableViewOrder: UITableView!
    
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var viewOrderHeader: UIView!
    
    @IBOutlet weak var naviTitle: UINavigationItem!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad 3rd")
        
        //탭바 윗줄 없애기
        self.tabBarController?.tabBar.clipsToBounds = true
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
        //뷰 그림자 넣기 (그림자공간줘야함, 배경색흰색으로 안하면 안에있는 컴포넌트들 그림자 생김)
        view3.layer.shadowOffset = CGSize(width: 0, height: 2)   //그림자 크기
        view3.layer.shadowOpacity = 0.15                          //그림자 투명도 0이 투명 1이 불투명
        view3.layer.shadowRadius = 2  //번지는정도 (0일때 선, 높을 수록 번짐)
        view3.layer.shadowPath = UIBezierPath(rect: view3.bounds).cgPath

        
        view4.layer.shadowOffset = CGSize(width: 0, height: 1)   //그림자 크기
        view4.layer.shadowOpacity = 0.05                          //그림자 투명도 0이 투명 1이 불투명
        view4.layer.shadowRadius = 0  //번지는정도 (0일때 선, 높을 수록 번짐)
        view4.layer.shadowPath = UIBezierPath(rect: view4.bounds).cgPath

        
        //셀리소스파일 가져오기 (여기서 ""이름은 xib파일 이름!!)
        let tableViewCellNib = UINib(nibName: "TableViewCellOrder", bundle: nil)
        //셀가져온 리소스 등록 (여기서 ""이름은 xib파일에서 인스펙터(삼지창)에 있는 identifier)
        self.tableViewOrder.register(tableViewCellNib, forCellReuseIdentifier: "TableViewCellOrder")
        
        //테이블 각 셀의 높이
        self.tableViewOrder.rowHeight = 90
        
        //****아주 중요****
        self.tableViewOrder.delegate = self
        self.tableViewOrder.dataSource = self
        

        //네비게이션 뒤로가기 버튼
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .darkGray
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        
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
    
}


extension ViewControllerOrder: UITableViewDelegate {
    //테이블뷰 스크롤할 때
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollOffset = scrollView.contentOffset.y
//        print(scrollOffset)
        
        //스크롤할 때 LargeTitle 없애기
        if scrollOffset <= 0 {
            naviTitle.largeTitleDisplayMode = .always
        } else {
            naviTitle.largeTitleDisplayMode = .never
        }
    }
    
    //MARK: Oder테이블뷰 셀 클릭 시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        resultSelectedTitle = titleArray[indexPath.row]
        //세그의 identifier
        performSegue(withIdentifier: "goViewControllerOrderCategory", sender: nil)
        
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerOrderCategory") as! ViewControllerOrderCategory
////        vc.userChoice = getUserShape(sender)
//
//        present(vc, animated: true, completion: nil)
        
        
        
//        //스토리보드의 이름으로 스토리보드 연결
//        let storyboardOrder = UIStoryboard(name: "StoryboardOrder", bundle: nil)
//        //스토리보드와 ViewController파일 연결
//        let ViewControllerOrdeMenu = storyboardOrder.instantiateViewController(withIdentifier: "ViewControllerOrdeMenu") as! ViewControllerOrdeMenu
//
//        //(질문???)여기에서 배열이 아니라 셀의 위치로 해야하는 건데 .. 모르겠다..
//        //넘겨주기
//        ViewControllerOrdeMenu.resultSelectedTitle = titleArray[indexPath.row]
//        ViewControllerOrdeMenu.resultSelectedSubTitle = subTitleArray[indexPath.row]
//        ViewControllerOrdeMenu.resultSelectedTitleImage = titleImageArray[indexPath.row]
//
//        ViewControllerOrdeMenu.modalPresentationStyle = .fullScreen
//        self.present(ViewControllerOrdeMenu, animated: true, completion: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ViewControllerOrderCategory = segue.destination as! ViewControllerOrderCategory
        
        ViewControllerOrderCategory.resultTitle = resultSelectedTitle
    }
    
}


//MARK: 테이블뷰데이터소스
extension ViewControllerOrder: UITableViewDataSource{
    //테이블 뷰 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray.count
    }
    
    //MARK: Oder테이블뷰 각 셀에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //셀 파일이랑 연결시키기
        let cell = tableViewOrder.dequeueReusableCell(withIdentifier: "TableViewCellOrder", for: indexPath) as! TableViewCellOrder
    
        
        //셀 내용넣기
        cell.orderTitleLabel.text = titleArray[indexPath.row]
        cell.orderTitleImage.image = UIImage(named: titleImageArray[indexPath.row])
        cell.orderSubTitleLabel.text = subTitleArray[indexPath.row]
        
        if indexPath.row == 0 {
            cell.orderSubTitleLabel.isHidden = true
        }

        
        //클릭했을 때 배경이 회색으로 변하는 거 없애기
        cell.selectionStyle = .none
        
        
        return cell
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
