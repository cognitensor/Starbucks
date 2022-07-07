//
//  ViewControllerOrder.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/06.
//

import UIKit

class ViewController3Order: UIViewController {
    
    @IBOutlet weak var tableView3Order: UITableView!
    
    
    let titleArray = ["New", "추천", "리저브 에스프레소", "리저브 드립", "리프레서", "콜드브루", "블론드", "에스프레소", "디카페인 커피", "프라푸치노", "블렌디드", "피지오", "티바나", "브루드 커피", "기타", "병음료"]
    
    
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ViewController3Order: UITableViewDelegate{
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        
//        
//    }
    
}
extension ViewController3Order: UITableViewDataSource {
    
    //테이블 뷰 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray.count
    }
    
    //각 셀에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView3Order.dequeueReusableCell(withIdentifier: "TableViewCell3Order", for: indexPath) as! TableViewCell3Order
        
        cell.orderTitleLabel.text = titleArray[indexPath.row]
        
        return cell
        
    }
    
    
}
