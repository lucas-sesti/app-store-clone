//
//  AppDetalheScreenshotCell.swift
//  App Store
//
//  Created by Lucas Sesti on 25/09/20.
//

import UIKit

class AppDetalheScreenshotCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var app: App? {
        didSet {
            if app != nil {
                self.collectionView.reloadData()
            }
        }
    }
    
    let tituloLabel: UILabel = .textLabel(text: "Pré-visualizar", fontSize: 24, numberOfLines: 1, caption: false, bold: true)
    
    var collectionView: UICollectionView!
    
    let cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = .fast
        
        collectionView.register(ScreenshotCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(tituloLabel)
        tituloLabel.preencher(top: topAnchor, bottom: nil, leading: leadingAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        
        addSubview(collectionView)
        collectionView.preencher(top: tituloLabel.bottomAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.app?.screenshotUrls?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenshotCell
        
        if let imagemUrl = self.app?.screenshotUrls?[indexPath.item] {
            cell.imageView.sd_setImage(with: URL(string: imagemUrl), completed: nil)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 220, height: collectionView.bounds.height)
    }
}

class ScreenshotCell: UICollectionViewCell {
    
    let imageView: UIImageView = .screenshotImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.image = UIImage(named: "screenshot")
        
        addSubview(imageView)
        imageView.preencherSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
