//
//  AppsGrupoCell.swift
//  App Store
//
//  Created by Lucas Sesti on 25/09/20.
//

import UIKit

class AppsGrupoCell: UICollectionViewCell {
    
    let titleLabel: UILabel = .textLabel(text: "App Grupo Título", fontSize: 24, bold: true)
    let appsGroupoHorizontalVC = AppsGroupoHorizontalVC()
    
    var grupo: AppGrupo? {
        didSet {
            if let grupo = grupo {
                titleLabel.text = grupo.titulo
                appsGroupoHorizontalVC.apps = grupo.apps
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        addSubview(titleLabel)
        titleLabel.preencher(
            top: topAnchor,
            bottom: nil,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 0, left: 20, bottom: 0, right: 20)
        )
        
        addSubview(appsGroupoHorizontalVC.view)
        appsGroupoHorizontalVC.view.preencher(
            top: titleLabel.bottomAnchor,
            bottom: bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 10, left: 0, bottom: 0, right: 0)
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
