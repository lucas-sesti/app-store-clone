//
//  BuscaCell.swift
//  App Store
//
//  Created by Lucas Sesti on 24/09/20.
//

import UIKit
import SDWebImage

class BuscaCell: UITableViewCell {
    
    var app: App! {
        didSet {
            titleLabel.text = app.nome
            empresaLabel.text = app.empresa
            
            iconeImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
            
            if let screenshotUrls = app.screenshotUrls {
                if screenshotUrls.count > 0 {
                    self.screenshot1ImageView.sd_setImage(with: URL(string: screenshotUrls[0]), completed: nil)
                }
                
                if screenshotUrls.count > 1 {
                    self.screenshot1ImageView.sd_setImage(with: URL(string: screenshotUrls[1]), completed: nil)
                }
                
                if screenshotUrls.count > 2 {
                    self.screenshot1ImageView.sd_setImage(with: URL(string: screenshotUrls[2]), completed: nil)
                }
            }
        }
    }
    
    let iconeImageView: UIImageView = .iconeImageView()
    let titleLabel: UILabel = .textLabel(text: "App nome", fontSize: 18, numberOfLines: 2)
    let empresaLabel: UILabel = .textLabel(text: "Empresa nome", fontSize: 14, caption: true)
    let button: UIButton = .getButton()
    
    let screenshot1ImageView: UIImageView = .screenshotImageView()
    let screenshot2ImageView: UIImageView = .screenshotImageView()
    let screenshot3ImageView: UIImageView = .screenshotImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let titleBusinessStackView = UIStackView(arrangedSubviews: [titleLabel, empresaLabel])
        titleBusinessStackView.spacing = 8
        titleBusinessStackView.axis = .vertical
        
        let headerStackView: UIStackView = UIStackView(arrangedSubviews: [iconeImageView, titleBusinessStackView, button])
        headerStackView.spacing = 12
        headerStackView.alignment = .center
        
        let screenshotStackView = UIStackView(arrangedSubviews: [
            screenshot1ImageView,
            screenshot2ImageView,
            screenshot3ImageView
        ])
        
        screenshotStackView.spacing = 12
        screenshotStackView.distribution = .fillEqually
        
        let globalStackView = UIStackView(arrangedSubviews: [
            headerStackView,
            screenshotStackView
        ])
        
        globalStackView.spacing = 16
        globalStackView.axis = .vertical
        
        addSubview(globalStackView)
        globalStackView.preencherSuperView(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
