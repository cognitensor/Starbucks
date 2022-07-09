//
//  ViewController3Order1ClickCategory.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/08.
//

import UIKit

class ViewControllerOrder1Menu: UIViewController, UIScrollViewDelegate {
    
    @IBAction func didTabAction(_ sender: Any) {
        dismiss(animated: false)
    }
    
    //기기의 높이값
    let maxHeight = (UIScreen.main.bounds.size.height)*0.35
//    let maxHeight = 300.0
    let minHeight: CGFloat = 40.0

    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var naviTitle: UINavigationItem!
    @IBOutlet weak var naviLeftBtn: UIBarButtonItem!
    @IBOutlet weak var naviRightBtn: UIBarButtonItem!
    
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
        print(scrollOffset)
        
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
            naviTitle.title = "메뉴이름"
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
