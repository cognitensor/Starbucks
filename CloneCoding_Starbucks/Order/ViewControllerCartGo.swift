//
//  ViewControllerCartGo.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/18.
//

import UIKit
import PanModal

class ViewControllerCartGo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}

extension ViewControllerCartGo: PanModalPresentable {

    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(150)
    }
}
