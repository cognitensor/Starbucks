//
//  TableViewCellCartFooter.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/18.
//

import UIKit

class TableViewCellCartFooter: UITableViewCell {

    @IBOutlet weak var viewQR: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


        viewQR.layer.cornerRadius = 20 // 컵 선택 뷰의 꼭짓점 굴곡률
        viewQR.layer.borderWidth = 0.5
        viewQR.layer.borderColor = UIColor.systemGray4.cgColor
    }
    
}
