//
//  CollectionViewCellHomeRecommend.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/16.
//

import UIKit

class CollectionViewCellHomeRecommend: UICollectionViewCell {
    
    @IBOutlet weak var homeRecommendImage: UIImageView!
    @IBOutlet weak var homeRecommendTitle: UILabel!
    
    @IBOutlet weak var imageleftAnchor: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        homeRecommendImage.layer.cornerRadius = homeRecommendImage.frame.height / 2
    }

}
