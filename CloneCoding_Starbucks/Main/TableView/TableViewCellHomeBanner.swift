//
//  TableViewCellHomeBanner.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/16.
//

import UIKit

class TableViewCellHomeBanner: UITableViewCell {

    @IBOutlet weak var imageViewBanner: UIImageView! 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageViewBanner.addShadow(location: .bottom)
        
//        imageViewBanner.layer.shadowOffset = CGSize(width: 1, height: 5)   //그림자 크기
//        imageViewBanner.layer.shadowOpacity = 0.15                          //그림자 투명도 0이 투명 1이 불투명
//        imageViewBanner.layer.shadowRadius = 20
//        imageViewBanner.layer.shadowPath = UIBezierPath(rect: imageViewBanner.bounds).cgPath
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    override func prepareForReuse() {
        imageViewBanner.image = nil
    }

}
