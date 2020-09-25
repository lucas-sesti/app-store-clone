//
//  AppsGrupoHorizontalCell.swift
//  App Store
//
//  Created by Lucas Sesti on 25/09/20.
//

import UIKit

class AppsGrupoHorizontalCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            if let app = app {
                iconImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                titleLabel.text = app.nome
                businessLabel.text = app.empresa
            }
        }
    }
    
    let iconImageView: UIImageView = .iconeImageView()
    let titleLabel: UILabel = .textLabel(text: "App nome", fontSize: 18, numberOfLines: 2)
    let businessLabel: UILabel = .textLabel(text: "App empresa", fontSize: 14, caption: true)
    let gainButton: UIButton = .getButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bottomLine: CALayer = CALayer()
        bottomLine.frame = CGRect(
            x: 80,
            y: bounds.height,
            width: bounds.width - 80,
            height: 0.8
        )
        
        bottomLine.backgroundColor = UIColor.gray.cgColor
        layer.addSublayer(bottomLine)
        
        let titleBusinessStackView = UIStackView(arrangedSubviews: [titleLabel, businessLabel])
        titleBusinessStackView.spacing = 4
        titleBusinessStackView.axis = .vertical
        
        let stackView: UIStackView = UIStackView(arrangedSubviews: [iconImageView, titleBusinessStackView, gainButton])
        stackView.spacing = 12
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.preencherSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
