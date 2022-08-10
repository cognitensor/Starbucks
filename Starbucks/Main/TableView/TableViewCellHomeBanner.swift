//
//  TableViewCellHomeBanner.swift
//  Starbucks
//
//  Created by 하늘이 on 2022/07/16.
//

import UIKit

class TableViewCellHomeBanner: UITableViewCell {

    @IBOutlet weak var imageViewBanner: UIImageView! 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //배너 테이블뷰셀 그림자 설정
        imageViewBanner.addShadow(location: .bottom)
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    override func prepareForReuse() {
        imageViewBanner.image = nil
    }

}
