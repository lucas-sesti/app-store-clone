//
//  AppDetalheDescricaoCell.swift
//  App Store
//
//  Created by Lucas Sesti on 25/09/20.
//

import UIKit

class AppDetalheDescricaoCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            if let app = app {
                descricaoLabel.text = app.descricao
            }
        }
    }
    
    let tituloLabel: UILabel = .textLabel(text: "Novidades", fontSize: 24, numberOfLines: 1, caption: false, bold: true)
    let descricaoLabel: UILabel = .textLabel(text: "Descrição", fontSize: 12, numberOfLines: 0, caption: false, bold: false)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackView = UIStackView(arrangedSubviews: [tituloLabel, descricaoLabel])
        stackView.spacing = 12
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.preencherSuperView(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
