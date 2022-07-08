//
//  TableViewCell3Order.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/07.
//

import Foundation
import UIKit

class TableViewCell3Order: UITableViewCell {
    
    @IBOutlet weak var orderContentView: UIView!
    @IBOutlet weak var orderTitleImage: UIImageView!
    @IBOutlet weak var orderTitleLabel: UILabel!
    @IBOutlet weak var orderSubTitleLabel: UILabel!
    
    //셀이 렌더링(그릴때) 될때
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        print("TableViewCell3Order -awakeFromNib")
        
        
        orderTitleImage.layer.cornerRadius = orderTitleImage.frame.height/2
        
        
    }
    
}
