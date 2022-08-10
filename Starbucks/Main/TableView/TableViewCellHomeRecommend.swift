//
//  collectionViewRecommend.swift
//  Starbucks
//
//  Created by 하늘이 on 2022/07/16.
//

import UIKit

class TableViewCellHomeRecommend: UITableViewCell {

    @IBOutlet weak var collectionLabelTitle: UILabel!
    @IBOutlet weak var collectionViewRecommend: UICollectionView!
    
    func config() {
        collectionViewRecommend.reloadData()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        registerXib()
        registerDelegate()
        
        //컬렉션뷰안에 있는 컨텐츠에 대한 위치
        collectionViewRecommend.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    
    //xib파일 등록하는 메서드
    func registerXib() {
        let collectionViewCellNib = UINib(nibName: "CollectionViewCellHomeRecommend", bundle: nil)
        collectionViewRecommend.register(collectionViewCellNib, forCellWithReuseIdentifier: "CollectionViewCellHomeRecommend")
    }
    
    func registerDelegate() {
        collectionViewRecommend.delegate = self
        collectionViewRecommend.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension TableViewCellHomeRecommend: UICollectionViewDelegate {
    
}

extension TableViewCellHomeRecommend: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return homeRecommend.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionViewRecommend.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellHomeRecommend", for: indexPath) as! CollectionViewCellHomeRecommend
        
        cell.homeRecommendImage.image = homeRecommend[indexPath.row].recommendImage
        cell.homeRecommendTitle.text = homeRecommend[indexPath.row].recommendTitle
        
        return cell
    }
    
}

extension TableViewCellHomeRecommend: UICollectionViewDelegateFlowLayout {

    //컬렉션뷰 각각 셀 하나의 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 180)
    }
    
}
