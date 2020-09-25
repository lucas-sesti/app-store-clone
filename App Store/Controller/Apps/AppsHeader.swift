//
//  AppsHeader.swift
//  App Store
//
//  Created by Lucas Sesti on 24/09/20.
//

import UIKit

class AppsHeader: UICollectionReusableView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    var collectionView: UICollectionView!
    
    var appsEmDestaque: [AppDestaque] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        let layout = UICollectionViewFlowLayout()
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        collectionView.preencherSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension AppsHeader {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appsEmDestaque.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsHeaderCell
        
        cell.appDestaque = self.appsEmDestaque[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: bounds.width - 40, height: bounds.height)
    }
}
