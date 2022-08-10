//
//  ViewControllerOrder.swift
//  Starbucks
//
//  Created by 하늘이 on 2022/07/06.
//

import UIKit



class ViewControllerOrder: UIViewController {
        
    var resultSelectedTitle: String = ""
    var resultSelectedSubTitle: String = ""
    var resultSelectedTitleImage: String = ""
    
    @IBOutlet weak var tableViewOrder: UITableView!
    
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var viewOrderHeader: UIView!
    
    @IBOutlet weak var naviTitle: UINavigationItem!
    
    @IBOutlet weak var btnBagZero: UIButton!
    @IBOutlet weak var btnBagIcon: UIButton!
    @IBOutlet weak var labelBagCount: UILabel!

    var countSum2: Int = 0


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
        

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear 3rd")
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        
        var countSum: Int = 0

        if cartData.count != 0 {
            btnBagIcon.isHidden = false
            labelBagCount.isHidden = false
            btnBagZero.isHidden = true
            
            for count in 0...cartData.count-1 {
                countSum = countSum + cartData[count].cartCount
            }
            
        } else {
            btnBagIcon.isHidden = true
            labelBagCount.isHidden = true
            btnBagZero.isHidden = false
        }
        labelBagCount.text = String(countSum)
        countSum2 = countSum
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
    
    
    //세그 전달경로
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goViewControllerOrderCategory" {
            let ViewControllerOrderCategory = segue.destination as! ViewControllerOrderCategory
            ViewControllerOrderCategory.resultTitle = resultSelectedTitle
            
            //네비게이션 뒤로가기 버튼
            let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
            backBarButtonItem.tintColor = .darkGray
            self.navigationItem.backBarButtonItem = backBarButtonItem
            
            
        } else if segue.identifier == "goViewControllerCart" {
            let ViewControllerCart = segue.destination as! ViewControllerCart
            ViewControllerCart.resultCountSum = countSum2
            
            
            //네비게이션 뒤로가기 버튼
            let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
            backBarButtonItem.tintColor = .white
            self.navigationItem.backBarButtonItem = backBarButtonItem
            
        } else {
            print("세그연결해줘야함")
        }
        
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
        
        resultSelectedTitle = orderCategoryData[indexPath.row].orderTitle
        
        //세그의 identifier, prepare로 전달
        performSegue(withIdentifier: "goViewControllerOrderCategory", sender: nil)

    }
}


//MARK: 테이블뷰데이터소스
extension ViewControllerOrder: UITableViewDataSource{
    
    
    //테이블 뷰 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderCategoryData.count
    }
    
    //MARK: Oder테이블뷰 각 셀에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //셀 파일이랑 연결시키기
        let cell = tableViewOrder.dequeueReusableCell(withIdentifier: "TableViewCellOrder", for: indexPath) as! TableViewCellOrder
    
        //셀 내용넣기
        cell.orderTitleImage.image = orderCategoryData[indexPath.row].orderImage
        cell.orderTitleLabel.text = orderCategoryData[indexPath.row].orderTitle
        cell.orderSubTitleLabel.text = orderCategoryData[indexPath.row].orderEngTitle
        cell.orderSwitch.isOn = orderCategoryData[indexPath.row].switchOn
        
        if indexPath.row == 0 {
            cell.orderSubTitleLabel.isHidden = true
        }
        
        
        cell.orderCellIndex = indexPath.row
        cell.switchOnDelegate = self

        
        //클릭했을 때 배경이 회색으로 변하는 거 없애기
        cell.selectionStyle = .none
        
        return cell
    }

}

extension ViewControllerOrder: SwitchOnDelegate{
    func switchChange(index: Int, switchIs: Bool) {
        orderCategoryData[index].switchOn = switchIs
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
