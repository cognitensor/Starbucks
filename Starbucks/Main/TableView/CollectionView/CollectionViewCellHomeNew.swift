//
//  CollectionViewCellHomeNew.swift
//  Starbucks
//
//  Created by 하늘이 on 2022/07/17.
//

import UIKit

class CollectionViewCellHomeNew: UICollectionViewCell {
    
    @IBOutlet weak var imageViewHomeNew: UIImageView!
    @IBOutlet weak var labelHomeNewTitle: UILabel!
    @IBOutlet weak var labelHomeNewContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageViewHomeNew.layer.cornerRadius = 5
    }

}
