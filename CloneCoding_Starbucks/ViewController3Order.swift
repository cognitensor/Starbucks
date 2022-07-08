//
//  ViewControllerOrder.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/06.
//

import UIKit

class ViewController3Order: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let titleArray = ["New", "추천", "리저브 에스프레소", "리저브 드립", "리프레서", "콜드브루", "블론드", "에스프레소", "디카페인 커피", "프라푸치노", "블렌디드", "피지오", "티바나", "브루드 커피", "기타", "병음료"]
    let titleImageArray = ["order_1new", "order_2recommend", "order_3reserve", "order_4drip", "order_5refreshers", "order_6coldbrew", "order_7blonde", "order_8espresso", "order_9decaf", "order_10frappuccino", "order_11blended", "order_12fizzio", "order_13tevana", "order_14brewed", "order_15others", "order_16rtd"]
    
    
    
    let maxHeight: CGFloat = 200.0
    let minHeight: CGFloat = 150.0
    
    @IBOutlet weak var tableView3Order: UITableView! {
        didSet {
            tableView3Order.contentInset = UIEdgeInsets(top: maxHeight, left: 0, bottom: 0, right: 0)
        }
    }
    
    @IBOutlet weak var orderMainHeaderViewHeight: NSLayoutConstraint! {
        didSet {
            orderMainHeaderViewHeight.constant = maxHeight
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad 3rd")
        // Do any additional setup after loading the view.
        
        //셀리소스파일 가져오기
        let tableViewCellNib = UINib(nibName: "TableViewCell3Order", bundle: nil)
        
        //셀가져온 리소스 등록
        self.tableView3Order.register(tableViewCellNib, forCellReuseIdentifier: "TableViewCell3Order")
        
//        self.tableView3Order.rowHeight = UITableView.automaticDimension
        self.tableView3Order.rowHeight = 80
        
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
    
    
    
    
    @IBOutlet weak var viewOrderHeader: UIView!
    @IBOutlet weak var labelHiddenTitle: UILabel!
    @IBOutlet weak var viewBigTitle: UIView!
    
    //--UITableViewDelegate--
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let scrollOffset = scrollView.contentOffset.y
        print(scrollOffset)
        
        if scrollOffset <= -maxHeight {
            labelHiddenTitle.isHidden = true
            
        } else if scrollOffset > -maxHeight && scrollOffset < -160 {
            labelHiddenTitle.isHidden = false
            
            viewOrderHeader.transform = CGAffineTransform(translationX: 0, y: abs(scrollOffset)-maxHeight)
            
        } else {
            labelHiddenTitle.isHidden = false
        }
        
    }
    
    
    
    
    //--UITableViewDataSource--
    //테이블 뷰 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray.count
    }
    
    //각 셀에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView3Order.dequeueReusableCell(withIdentifier: "TableViewCell3Order", for: indexPath) as! TableViewCell3Order
    
        cell.orderTitleLabel.text = titleArray[indexPath.row]
        cell.orderTitleImage.image = UIImage(named: titleImageArray[indexPath.row])
        
        if indexPath.row == 0 {
            cell.orderSubTitleLabel.isHidden = true
            
        }
        
        
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
