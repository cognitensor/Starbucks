//
//  ViewControllerOrderCategory.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/14.
//

import UIKit


class ViewControllerOrderCategory: UIViewController {
    
    let arrayCategoryTitleImage = ["order_1new", "order_2recommend", "order_3reserve", "order_4drip", "order_5refreshers", "order_6coldbrew", "order_7blonde", "order_8espresso", "order_9decaf", "order_10frappuccino"]
    let arrayCategoryTitle = ["아이스 카페 아메리카노", "아이스 자몽 허니 블랙 티", "아이스 카페 라떼", "서머 픽 시트러스 블렌디드", "카페 아메리카노", "커피 드로잉 말차 프라푸치노", "아이스 스타벅스 돌체 라떼", "퍼를 사워 블렌디드", "콜드 브루", "아이스 디카페인 카페 아메리카노"]
    let arrayCategoryEngTitle = ["Iced Caffe Americano", "Iced Frapefruit Honey Black Tea", "Iced Caffe Latte", "Summer Pick Citrus Blended", "Caffe Americano", "Coffe drawing Malcha Frappuccino", "Iced Starbucks Dolce Latte", "Purple Sour Blended", "Cold Brew", "Iced DECAF Caffe Americano"]
    let arrayCategoryPrice = [4500, 5700, 5000, 6500, 4500, 6300, 5900, 6300, 4900, 4800]
    

    @IBAction func unwindOrderCategoryVC(_ segue: UIStoryboardSegue) {
        print("뒤로가기")
    }
    
    @IBOutlet weak var tableViewCategory: UITableView!
    @IBOutlet weak var naviTitle: UINavigationItem!
  
    //보낼 메뉴 이름
    var resultSelectedTitle: String = ""
    var resultSelectedEngTitle: String = ""
    var resultSelectedTitleImage: String = ""
    var resultSelectedPrice: Int = 0

    //바로 전에 받은 메뉴 이름
    var resultTitle: String = ""
    
    @IBOutlet weak var btnBagZero: UIButton!
    @IBOutlet weak var btnBagIcon: UIButton!
    @IBOutlet weak var labelBagCount: UILabel!

    var countSum2: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //셀  파일 가져오기
        let tableViewCellNibCategory = UINib(nibName: "TableViewCellOrderCategory", bundle: nil)

        //셀에 리소스를 등록
        self.tableViewCategory.register(tableViewCellNibCategory, forCellReuseIdentifier: "TableViewCellOrderCategory")
        
        self.tableViewCategory.rowHeight = 110

        self.tableViewCategory.delegate = self
        self.tableViewCategory.dataSource = self
        
        naviTitle.title = resultTitle
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var countSum: Int = 0

        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        
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
    
    //세그 전달경로
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goViewControllerOrderMenu" {
            let ViewControllerOrderMenu = segue.destination as! ViewControllerOrderMenu
            
            ViewControllerOrderMenu.resultTitle = resultSelectedTitle
            ViewControllerOrderMenu.resultEngTitle = resultSelectedEngTitle
            ViewControllerOrderMenu.resultTitleImage = resultSelectedTitleImage
            ViewControllerOrderMenu.resultPrice = resultSelectedPrice
            
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

extension ViewControllerOrderCategory: UITableViewDelegate {
    
    //MARK: OderCategory테이블뷰 스크롤
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollOffset = scrollView.contentOffset.y
        
        //스크롤할 때 LargeTitle 없애기
        if scrollOffset <= 0 {
            naviTitle.largeTitleDisplayMode = .always
        } else {
            naviTitle.largeTitleDisplayMode = .never
        }
    }
    
    
    //MARK: OderCategory테이블뷰 셀 클릭 시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        resultSelectedTitle = arrayCategoryTitle[indexPath.row]
        resultSelectedEngTitle = arrayCategoryEngTitle[indexPath.row]
        resultSelectedTitleImage = arrayCategoryTitleImage[indexPath.row]
        resultSelectedPrice = arrayCategoryPrice[indexPath.row]
        
        //세그의 identifier, 세그이동 수행(prepare)
        performSegue(withIdentifier: "goViewControllerOrderMenu", sender: nil)
    }
    
}

extension ViewControllerOrderCategory: UITableViewDataSource {
    
    //테이블 뷰 셀의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayCategoryTitle.count
    }
    
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //이것을 작성함으로 셀에 만든 이비지뷰와 라벨에 접근가능하다
        let cell = tableViewCategory.dequeueReusableCell(withIdentifier: "TableViewCellOrderCategory", for: indexPath) as! TableViewCellOrderCategory
        
        //셀 내용넣기
        cell.imageViewcategoryMenu.image = UIImage(named: arrayCategoryTitleImage[indexPath.row])
        cell.labelCategoryMenuTitle.text = arrayCategoryTitle[indexPath.row]
        cell.labelCategoryMenuEngTitle.text = arrayCategoryEngTitle[indexPath.row]
        cell.labelCategoryMenuPrice.text = "\(numberFormatter(number: arrayCategoryPrice[indexPath.row]))원"
        
        cell.selectionStyle = .none


        return cell
    }
    
}
