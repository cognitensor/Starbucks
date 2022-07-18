//
//  ViewControllerCart.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/18.
//

import UIKit

class ViewControllerCart: UIViewController {
    @IBOutlet weak var naviTitle: UINavigationItem!
    
    var resultCountSum: Int = 0
    
    @IBOutlet weak var viewCount: UIView!
    @IBOutlet weak var viewCount2: UIView!
    @IBOutlet weak var labelCount: UILabel!

    @IBOutlet weak var tableViewCart: UITableView!
    
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var viewbottomBottomAnchor: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            
        viewCount.layer.cornerRadius = viewCount.frame.height / 2
        viewCount2.layer.cornerRadius = viewCount2.frame.height / 2
        viewBottom.addShadow(offset: CGSize(width: 0, height: -2), color: .gray, opacity: 0.1, radius: 3)
        
        let tableViewCellCartZero = UINib(nibName: "TableViewCellCartZero", bundle: nil)
        self.tableViewCart.register(tableViewCellCartZero, forCellReuseIdentifier: "TableViewCellCartZero")
        
        let tableViewCellCartHeader = UINib(nibName: "TableViewCellCartHeader", bundle: nil)
        self.tableViewCart.register(tableViewCellCartHeader, forCellReuseIdentifier: "TableViewCellCartHeader")
        
        let tableViewCellCart = UINib(nibName: "TableViewCellCart", bundle: nil)
        self.tableViewCart.register(tableViewCellCart, forCellReuseIdentifier: "TableViewCellCart")
        
        let tableViewCellCartFooter = UINib(nibName: "TableViewCellCartFooter", bundle: nil)
        self.tableViewCart.register(tableViewCellCartFooter, forCellReuseIdentifier: "TableViewCellCartFooter")

        tableViewCart.delegate = self
        tableViewCart.dataSource = self
        
        print(cartData.count)
        if cartData.count == 0 {
            viewBottom.isHidden = true
            viewbottomBottomAnchor.constant = -100
        } else {
            viewBottom.isHidden = false
            viewbottomBottomAnchor.constant = 0
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
           labelCount.text = String(resultCountSum)
        
    }

}



extension ViewControllerCart: UITableViewDelegate {
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
}


//MARK: 테이블뷰데이터소스
extension ViewControllerCart: UITableViewDataSource{
    //섹션의 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        if cartData.count == 0 {
            return 1
        } else {
            return 3
        }
        
    }
    
    //테이블 뷰 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if cartData.count == 0 {
            return 1
        } else {
            if section == 0 {
                return 1
                
            } else if section == 1 {
                return cartData.count
                
            } else {
                return 1
            }
        }
        
    }
    
    //MARK: Oder테이블뷰 각 셀에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if cartData.count == 0 {
            let cell = tableViewCart.dequeueReusableCell(withIdentifier: "TableViewCellCartZero", for: indexPath) as! TableViewCellCartZero
            
            return cell
            
            
        } else {
            switch indexPath.section {
            case 0:
                let cell = tableViewCart.dequeueReusableCell(withIdentifier: "TableViewCellCartHeader", for: indexPath) as! TableViewCellCartHeader
                
                return cell
                
            case 1:
                
                let cell = tableViewCart.dequeueReusableCell(withIdentifier: "TableViewCellCart", for: indexPath) as! TableViewCellCart
                
                cell.imageViewCart.image = cartData[indexPath.row].cartImage
                cell.labelCartTitle.text = cartData[indexPath.row].cartTitle
                cell.labelCartEngTitle.text = cartData[indexPath.row].cartEngTitle
                cell.labelCartPrice.text = "\(numberFormatter(number: cartData[indexPath.row].cartPrice))원"
                cell.labelCartCount.text = "\(cartData[indexPath.row].cartCount)"
                cell.labelCartTotalPrice.text = "\(numberFormatter(number: cartData[indexPath.row].cartToTalPrice))원"
                
                if cartData[indexPath.row].cartCount > 1 {
                    cell.btnMinus.tintColor = .darkGray
                } else {
                    cell.btnMinus.tintColor = .systemGray3
                    cell.btnMinus.isEnabled = false
                }
                
                
                cell.cartCellIndex = indexPath.row
                cell.cartCellnumCount = cartData[indexPath.row].cartCount
                cell.cartCellonePrice = cartData[indexPath.row].cartPrice
                cell.numCountDelegate = self
                
                return cell
                
            case 2:
                let cell = tableViewCart.dequeueReusableCell(withIdentifier: "TableViewCellCartFooter", for: indexPath) as! TableViewCellCartFooter
                
                return cell
                
            default:
                return UITableViewCell()
            }
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if cartData.count == 0 {
            let height = tableViewCart.frame.height+100
            return height //100은 bottom뷰의 사이즈
            
        } else {
            switch indexPath.section {
            case 0:
                return 120
                
            case 1:
                return 230
                
            case 2:
                return 160
                
            default:
                return UITableView.automaticDimension
            }
        }
        
        
            
    }
}

extension ViewControllerCart: NumCountDelegate {
    func numCountChange(index: Int, numcount: Int, oneprice: Int) {
        cartData[index].cartCount = numcount
        cartData[index].cartPrice = oneprice
        cartData[index].cartToTalPrice = numcount*oneprice
    }
    
    func numCountChangeLabel() {
        var countSum: Int = 0
        for count in 0...cartData.count-1 {
            countSum = countSum+cartData[count].cartCount
        }
        labelCount.text = String(countSum)
    }
    
    func reloadTableView() {
        print("제로드")
        tableViewCart.reloadData()
        numCountChangeLabel()
    }
}
