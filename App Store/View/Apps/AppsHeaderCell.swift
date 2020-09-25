//
//  AppsHeaderCell.swift
//  App Store
//
//  Created by Lucas Sesti on 24/09/20.
//

import UIKit
import SDWebImage

class AppsHeaderCell: UICollectionViewCell {
    
    var appDestaque: AppDestaque? {
        didSet {
            if let appDestaque = appDestaque {
                businessLabel.text = appDestaque.empresa
                descriptionLabel.text = appDestaque.descricao
                imageView.sd_setImage(with: URL(string: appDestaque.imagemUrl), completed: nil)
            }
        }
    }
    
    let businessLabel: UILabel = .textLabel(text: "App Empresa", fontSize: 12)
    let descriptionLabel: UILabel = .textLabel(text: "App Descrição Header", fontSize: 20, numberOfLines: 2)
    let imageView: UIImageView = .screenshotImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        businessLabel.textColor = UIColor.blue
        
        let stackView: UIStackView = UIStackView(arrangedSubviews: [businessLabel, descriptionLabel, imageView])
        
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(stackView)
        stackView.preencherSuperView(padding: .init(top: 16, left: 0, bottom: 16, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
