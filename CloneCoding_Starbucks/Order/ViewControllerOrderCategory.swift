//
//  ViewControllerOrderCategory.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/14.
//

import UIKit


class ViewControllerOrderCategory: UIViewController {
    
    let arrayCategoryImage = ["order_1new", "order_2recommend", "order_3reserve", "order_4drip", "order_5refreshers", "order_6coldbrew", "order_7blonde", "order_8espresso", "order_9decaf", "order_10frappuccino"]
    let arrayCategoryTitle = ["아이스 카페 아메리카도", "아이스 자몽 허니 블랙 티", "아이스 카페 라떼", "서머 픽 시트러스 블렌디드", "카페 아메리카노", "커피 드로잉 말차 프라푸치노", "아이스 스타벅스 돌체 라떼", "퍼를 사워 블렌디드", "콜드 브루", "아이스 디카페인 카페 아메리카노"]
    let arrayCategoryEngTitle = ["Iced Caffe Americano", "Iced Frapefruit Honey Black Tea", "Iced Caffe Latte", "Summer Pick Citrus Blended", "Caffe Americano", "Coffe drawing Malcha Frappuccino", "Iced Starbucks Dolce Latte", "Purple Sour Blended", "Cold Brew", "Iced DECAF Caffe Americano"]
    let arrayCategoryPrice = [4500, 5700, 5000, 6500, 4500, 6300, 5900, 6300, 4900, 4800]

    
    @IBOutlet weak var naviBar: UINavigationItem!
    
    
    @IBOutlet weak var tableViewCategory: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //셀  파일 가져오기
        let tableViewCellNibCategory = UINib(nibName: "TableViewCellOrderCategory", bundle: nil)

        //셀에 리소스를 등록
        self.tableViewCategory.register(tableViewCellNibCategory, forCellReuseIdentifier: "TableViewCellOrderCategory")
        
        self.tableViewCategory.rowHeight = 110

        self.tableViewCategory.delegate = self
        self.tableViewCategory.dataSource = self
        
        naviBar.largeTitleDisplayMode = .always
        
    }

}

extension ViewControllerOrderCategory: UITableViewDelegate {
    
}

extension ViewControllerOrderCategory: UITableViewDataSource {
    
    //테이블 뷰 셀의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayCategoryImage.count
    }
    
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //이것을 작성함으로 셀에 만든 이비지뷰와 라벨에 접근가능하다
        let cell = tableViewCategory.dequeueReusableCell(withIdentifier: "TableViewCellOrderCategory", for: indexPath) as! TableViewCellOrderCategory
        
        //셀 내용넣기
        cell.imageViewcategoryMenu.image = UIImage(named: arrayCategoryImage[indexPath.row])
        cell.labelCategoryMenuTitle.text = arrayCategoryTitle[indexPath.row]
        cell.labelCategoryMenuEngTitle.text = arrayCategoryEngTitle[indexPath.row]
        cell.labelCategoryMenuPrice.text = "\(numberFormatter(number: arrayCategoryPrice[indexPath.row]))원"
        
        cell.selectionStyle = .none


        return cell
    }
    
}
