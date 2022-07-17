//
//  TableViewCellHomeNew.swift
//  CloneCoding_Starbucks
//
//  Created by 하늘이 on 2022/07/17.
//

import UIKit

class TableViewCellHomeNew: UITableViewCell {

    @IBOutlet weak var collectionViewHomeNew: UICollectionView!
    
    func config() {
        collectionViewHomeNew.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        registerXib()
        registerDelegate()
        
        //컬렉션뷰안에 있는 컨텐츠에 대한 위치
        collectionViewHomeNew.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

    }
    
    func registerXib() {
        let collectionViewCellNib = UINib(nibName: "CollectionViewCellHomeNew", bundle: nil)
        collectionViewHomeNew.register(collectionViewCellNib, forCellWithReuseIdentifier: "CollectionViewCellHomeNew")
    }
    
    func registerDelegate() {
        collectionViewHomeNew.delegate = self
        collectionViewHomeNew.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TableViewCellHomeNew: UICollectionViewDelegate {
}

extension TableViewCellHomeNew: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return homeNew.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionViewHomeNew.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellHomeNew", for: indexPath) as! CollectionViewCellHomeNew
        
        cell.imageViewHomeNew.image = homeNew[indexPath.row].homenewImage
        cell.labelHomeNewTitle.text = homeNew[indexPath.row].homenewTitle
        cell.labelHomeNewContent.text = homeNew[indexPath.row].homenewContent
        
        return cell
    }

}

extension TableViewCellHomeNew: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 250, height: collectionViewHomeNew.visibleSize.height)
    }
    
}
