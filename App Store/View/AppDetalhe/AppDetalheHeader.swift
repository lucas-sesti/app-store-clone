//
//  AppDetalhe.swift
//  App Store
//
//  Created by Lucas Sesti on 25/09/20.
//

import UIKit

class AppDetalheHeaderCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            if let app = app {
                iconeImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                tituloLabel.text = app.nome
                empresaLabel.text = app.empresa
            }
        }
    }
    
    let iconeImageView: UIImageView = .iconeImageView(width: 128, height: 128)
    let tituloLabel: UILabel = .textLabel(text: "App nome", fontSize: 20, numberOfLines: 2, caption: false, bold: false)
    let empresaLabel: UILabel = .textLabel(text: "App empresa", fontSize: 14, numberOfLines: 1, caption: true, bold: false)
    let obterButton: UIButton = .getButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        iconeImageView.image = UIImage(named: "icone")
        
        let buttonStackView = UIStackView(arrangedSubviews: [obterButton, UIView()])
        
        let titleStackView = UIStackView(arrangedSubviews: [tituloLabel, empresaLabel, buttonStackView])
        
        titleStackView.spacing = 12
        titleStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [iconeImageView, titleStackView])
        stackView.alignment = .center
        stackView.spacing = 12
        
        addSubview(stackView)
        stackView.preencherSuperView(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
