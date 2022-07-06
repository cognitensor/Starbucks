//
//  ViewController.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/06.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    //헤더뷰의 최대높이값과 최소높이값
    let maxHeight: CGFloat = 400.0
    let minHeight: CGFloat = 80.0

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var alphaHeaderView: UIView!
    
    @IBOutlet weak var mainScrollView: UIScrollView! {
        didSet {
            mainScrollView.contentInset = UIEdgeInsets(top: maxHeight, left: 0, bottom: 0, right: 0)
             }
        
    }

    @IBOutlet weak var heightConstraint: NSLayoutConstraint! {
        didSet {
                heightConstraint.constant = maxHeight
            }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            heightConstraint.constant = max(abs(scrollView.contentOffset.y), minHeight)
        } else {
            heightConstraint.constant = minHeight
        }
      }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainScrollView.delegate = self
        // Do any additional setup after loading the view.
    }


}

