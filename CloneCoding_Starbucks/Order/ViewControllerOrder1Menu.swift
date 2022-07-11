//
//  ViewController3Order1ClickCategory.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/08.
//

import UIKit

class ViewControllerOrder1Menu: UIViewController, UIScrollViewDelegate {
    
    //기기의 높이값
    let maxHeight = (UIScreen.main.bounds.size.height)*0.35
    let minHeight: CGFloat = 40.0
    
    //넘겨받는 변수
    var resultSelectedTitle: String = ""
    var resultSelectedSubTitle: String = ""
    var resultSelectedTitleImage: String = ""
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var naviTitle: UINavigationItem!
    @IBOutlet weak var naviLeftBtn: UIBarButtonItem!
    @IBOutlet weak var naviRightBtn: UIBarButtonItem!
    
    @IBOutlet weak var contentTitle: UILabel!
    @IBOutlet weak var contentSubTitle: UILabel!
    
    @IBOutlet weak var viewInfo: UIView!
    @IBOutlet weak var viewAle: UIView!
    @IBOutlet weak var viewBottom: UIView!
    
    @IBAction func naviLeftBtnTabAction(_ sender: Any) {
        dismiss(animated: false)
    }
    @IBAction func btnAction(_ sender: Any) {
        let ViewControllerOrder2Size = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerOrder2Size") as! ViewControllerOrder2Size
        
        ViewControllerOrder2Size.resultMainTitle = resultSelectedTitle
        ViewControllerOrder2Size.resultMainImage = resultSelectedTitleImage
        
        ViewControllerOrder2Size.modalPresentationStyle = .formSheet
        self.present(ViewControllerOrder2Size, animated: true, completion: nil)
    }
    
    @IBOutlet weak var mainScrollView: UIScrollView! {
        didSet {
            mainScrollView.contentInset = UIEdgeInsets(top: maxHeight, left: 0, bottom: 0, right: 0)
        }
    }
    
    @IBOutlet weak var fullImageBtnTopHeight: NSLayoutConstraint! {
        didSet {
            fullImageBtnTopHeight.constant = maxHeight
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollOffset = scrollView.contentOffset.y
//        print(scrollOffset)
        
        if scrollOffset <= -maxHeight {
            naviTitle.largeTitleDisplayMode = .always
            naviTitle.title = ""
            naviLeftBtn.tintColor = .white
            naviRightBtn.tintColor = .white
            headerImageView.isHidden = false
        } else if scrollOffset > -maxHeight && scrollOffset < -minHeight-20 {
            headerImageView.transform = CGAffineTransform(translationX: 0, y: abs(scrollOffset)-maxHeight)
            naviTitle.largeTitleDisplayMode = .always
            naviTitle.title = ""
            naviLeftBtn.tintColor = .white
            naviRightBtn.tintColor = .white
            headerImageView.isHidden = false
        } else {
            naviTitle.largeTitleDisplayMode = .never
            naviTitle.title = resultSelectedTitle
            naviLeftBtn.tintColor = .darkGray
            naviRightBtn.tintColor = .darkGray
            headerImageView.isHidden = true
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad 3rd_1")
        
        mainScrollView.delegate = self
        naviTitle.title = ""
        
        contentTitle.text = resultSelectedTitle
        contentSubTitle.text = resultSelectedSubTitle
        headerImageView.image = UIImage(named: resultSelectedTitleImage)
        
        viewInfo.layer.shadowOffset = CGSize(width: 0, height: -10)   //그림자 크기
        viewInfo.layer.shadowOpacity = 0.1                          //그림자 투명도 0이 투명 1이 불투명
        viewInfo.layer.shadowRadius = 0  //번지는정도 (0일때 선, 높을 수록 번짐)
        
        viewAle.layer.shadowOffset = CGSize(width: 0, height: -10)   //그림자 크기
        viewAle.layer.shadowOpacity = 0.1                          //그림자 투명도 0이 투명 1이 불투명
        viewAle.layer.shadowRadius = 0  //번지는정도 (0일때 선, 높을 수록 번짐)
        
        viewBottom.layer.shadowOffset = CGSize(width: 0, height: -1)   //그림자 크기
        viewBottom.layer.shadowOpacity = 0.1                          //그림자 투명도 0이 투명 1이 불투명
        viewBottom.layer.shadowRadius = 3  //번지는정도 (0일때 선, 높을 수록 번짐)
        
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
