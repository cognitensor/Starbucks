//
//  TableViewCellOrderCategory.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/14.
//

import UIKit

class TableViewCellOrderCategory: UITableViewCell {

    
    @IBOutlet weak var imageViewcategoryMenu: UIImageView!
    @IBOutlet weak var labelCategoryMenuTitle: UILabel!
    @IBOutlet weak var labelCategoryMenuEngTitle: UILabel!
    @IBOutlet weak var labelCategoryMenuPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageViewcategoryMenu.layer.cornerRadius = imageViewcategoryMenu.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
