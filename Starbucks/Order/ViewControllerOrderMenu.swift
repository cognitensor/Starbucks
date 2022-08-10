//
//  ViewControllerOrder1ClickCategory.swift
//  Starbucks
//
//  Created by 하늘이 on 2022/07/08.
//

import UIKit

class ViewControllerOrderMenu: UIViewController, UIScrollViewDelegate {
    
    //기기의 높이값
    let maxHeight = 400.0
    let minHeight: CGFloat = 150.0
    
    //바로 전에 받은 메뉴 이름
    var resultTitle: String = ""
    var resultEngTitle: String = ""
    var resultTitleImage: String = ""
    var resultPrice: Int = 0
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var naviTitle: UINavigationItem!
    @IBOutlet weak var naviLeftBtn: UIBarButtonItem!
    @IBOutlet weak var naviRightBtn: UIBarButtonItem!
    
    @IBOutlet weak var contentTitle: UILabel!
    @IBOutlet weak var contentEngTitle: UILabel!
    @IBOutlet weak var contentPrice: UILabel!
    
    @IBOutlet weak var viewInfo: UIView!
    @IBOutlet weak var viewAle: UIView!
    @IBOutlet weak var viewBottom: UIView!
    
    //주문하기버튼 클릭
//    @IBAction func btnAction(_ sender: Any) {
//        let ViewControllerOrderSize = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerOrderSize") as! ViewControllerOrderSize
//
//        ViewControllerOrderSize.resultMainTitle = resultTitle
//        ViewControllerOrderSize.resultMainImage = resultTitleImage
//        ViewControllerOrderSize.resultMainPrice = resultPrice
//
////        ViewControllerOrderSize.modalPresentationStyle = .formSheet
//        self.present(ViewControllerOrderSize, animated: true, completion: nil)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("ViewControllerOrderMenu 메뉴선택 주문하기")
        
        if segue.identifier == "goViewControllerOrderSize" {
            let ViewControllerOrderSize = segue.destination as! ViewControllerOrderSize
            
            ViewControllerOrderSize.resultMainImage = resultTitleImage
            ViewControllerOrderSize.resultMainEngTitle = resultEngTitle
            ViewControllerOrderSize.resultMainTitle = resultTitle
            ViewControllerOrderSize.resultMainPrice = resultPrice
        }
        
        
//
//        let ViewControllerOrderSize = segue.destination as! ViewControllerOrderSize
//
//        ViewControllerOrderSize.resultMainTitle = resultTitle
//        ViewControllerOrderSize.resultMainImage = resultTitleImage
//        ViewControllerOrderSize.resultMainPrice = resultPrice
//
//        performSegue(withIdentifier: "goViewControllerOrderSize", sender: nil)
//
    }
    
    
    
    
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint! {
        didSet {
            headerViewHeight.constant = maxHeight
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollOffset = scrollView.contentOffset.y
        if headerViewHeight.constant >= maxHeight+scrollOffset {
            //처음 전체 탑배너가 보일때
//            print("1")
            headerViewHeight.constant = maxHeight
            headerImageView.isHidden = false
            
            naviTitle.largeTitleDisplayMode = .always
            naviTitle.title = ""
            naviLeftBtn.tintColor = .white
            naviRightBtn.tintColor = .white
            
        } else if headerViewHeight.constant > minHeight+scrollOffset && headerViewHeight.constant < maxHeight+scrollOffset {
            //탑배너가 줄어들고 있을 때
//            print("2")
            headerViewHeight.constant = headerViewHeight.constant - scrollOffset
            
            
            //점점 올라갈 수록 흐리게
            let persent = (headerViewHeight.constant)/250
            headerImageView.alpha = persent
            headerImageView.isHidden = false
            scrollView.contentOffset.y = 0
            
            naviTitle.largeTitleDisplayMode = .always
            naviTitle.title = ""
            naviLeftBtn.tintColor = .white
            naviRightBtn.tintColor = .white
        } else {
            //탑배너가 최소 사이즈로 줄어들었을 때
//            print("3")
            headerViewHeight.constant = minHeight
            headerImageView.isHidden = true
            
            naviTitle.largeTitleDisplayMode = .never
            naviTitle.title = resultTitle
            naviLeftBtn.tintColor = .darkGray
            naviRightBtn.tintColor = .darkGray
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad 3rd_1")
        
        //네비게이션바 지우기
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        mainScrollView.delegate = self
        naviTitle.title = ""
        
        contentTitle.text = resultTitle
        contentEngTitle.text = resultEngTitle
        headerImageView.image = UIImage(named: resultTitleImage)
        contentPrice.text = "\(numberFormatter(number: resultPrice))원"
        
        
        //제품 영양정보 테두리
        viewInfo.layer.addBorder([.top], color: UIColor.systemGray6, width: 1.0)
        
        //알레르기 유발요인 테두리
        viewAle.layer.addBorder([.top], color: UIColor.systemGray6, width: 1.0)

        
        
        viewBottom.layer.shadowOffset = CGSize(width: 0, height: -1)   //그림자 크기
        viewBottom.layer.shadowOpacity = 0.1                          //그림자 투명도 0이 투명 1이 불투명
        viewBottom.layer.shadowRadius = 3  //번지는정도 (0일때 선, 높을 수록 번짐)
        viewBottom.layer.shadowPath = UIBezierPath(rect: viewBottom.bounds).cgPath

//        headerImageView.image = resultSelectedTitleImage
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear 3rd_1")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear 3rd_1")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear 3rd_1")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear 3rd_1")
    }

    

}
