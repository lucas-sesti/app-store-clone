//
//  AppDetalheAvaliacaoCell.swift
//  App Store
//
//  Created by Lucas Sesti on 25/09/20.
//

import UIKit

class AppDetalheAvaliacaoCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var app: App? {
        didSet {
            if app != nil {
                self.collectionView.reloadData()
            }
        }
    }
    
    let avaliacaoId = "avaliacaoId"
    
    let tituloLabel: UILabel = .textLabel(text: "Avaliações e opiniões", fontSize: 24, numberOfLines: 1, caption: false, bold: true)
    
    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = .fast
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        collectionView.register(ComentarioCell.self, forCellWithReuseIdentifier: avaliacaoId)

        addSubview(tituloLabel)
        tituloLabel.preencher(top: topAnchor, bottom: nil, leading: leadingAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        
        addSubview(collectionView)
        collectionView.preencher(top: tituloLabel.bottomAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.app?.comentarios?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: avaliacaoId, for: indexPath) as! ComentarioCell
        
        if let comentario = self.app?.comentarios?[indexPath.item] {
            cell.comentario = comentario
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.bounds.width - 40, height: collectionView.bounds.height)
    }
}

class ComentarioCell: UICollectionViewCell {
    
    var comentario: AppComentario? {
        didSet {
            if let comentario = comentario {
                tituloLabel.text = comentario.titulo
                comentarioLabel.text = comentario.descricao
                avaliacaoImageView.image = UIImage(named: "avaliacao-\(comentario.avaliacao)")
            }
        }
    }
    
    let tituloLabel: UILabel = .textLabel(text: "Muito bom", fontSize: 16, bold: true)
    let comentarioLabel: UILabel = .textLabel(text: "Descrição", fontSize: 16, numberOfLines: 0)
    
    let avaliacaoImageView: UIImageView = {
       let image = UIImageView()
        image.size(size: .init(width: 120, height: 24))
        image.contentMode = .scaleAspectFit
        return image
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.background
        layer.cornerRadius = 12
        layer.masksToBounds = true
        clipsToBounds = true
        
        avaliacaoImageView.image = UIImage(named: "avaliacao-4")
        
        let headerStackView = UIStackView(arrangedSubviews: [tituloLabel, avaliacaoImageView])
        
        let comentarioStackView = UIStackView(arrangedSubviews: [comentarioLabel])
        comentarioStackView.alignment = .top
        
        let stackView = UIStackView(arrangedSubviews: [headerStackView, comentarioStackView])
        stackView.spacing = 12
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.preencherSuperView(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
