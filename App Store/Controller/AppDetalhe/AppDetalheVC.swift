//
//  AppDetalhe.swift
//  App Store
//
//  Created by Lucas Sesti on 25/09/20.
//

import UIKit

class AppDetalheVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let headerId = "headerId"
    let descricaoId = "descricaoId"
    let screenshotId = "screenshotId"
    let avaliacaoId = "avaliacaoId"
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        ai.color = .gray
        ai.startAnimating()
        ai.hidesWhenStopped = true
        return ai
    }()
    
    var appId: Int! {
        didSet {
            self.buscaApp(appId: appId)
        }
    }
    var app: App?
    var loading: Bool = true
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
       
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.largeTitleDisplayMode = .never
        
        collectionView.backgroundColor = .white
        collectionView.register(AppDetalheHeaderCell.self, forCellWithReuseIdentifier: headerId)
        collectionView.register(AppDetalheDescricaoCell.self, forCellWithReuseIdentifier: descricaoId)
        collectionView.register(AppDetalheScreenshotCell.self, forCellWithReuseIdentifier: screenshotId)
        collectionView.register(AppDetalheAvaliacaoCell.self, forCellWithReuseIdentifier: avaliacaoId)
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centralizarSuperView()
    }
    
    func buscaApp(appId: Int) {
        AppsService.shared.buscaAppId(appId: appId) { (app, err) in
            if let app = app {
                DispatchQueue.main.async {
                    self.activityIndicatorView.stopAnimating()
                    self.loading = false
                    self.app = app
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.loading ? 1 : 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerId, for: indexPath) as! AppDetalheHeaderCell
            
            cell.app = self.app
            
            return cell
        }
        
        if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descricaoId, for: indexPath) as! AppDetalheDescricaoCell
            cell.app = self.app
            return cell
        }
        
        if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenshotId, for: indexPath) as! AppDetalheScreenshotCell
            cell.app = self.app
            
            return cell
        }
        
        if indexPath.item == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: avaliacaoId, for: indexPath) as! AppDetalheAvaliacaoCell
            cell.app = self.app
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = view.bounds.width
        var height: CGFloat = 170
        
        // Verificando se é a célula descrição do app e deixando
        // o tamanho para altura dinâmica
        
        if indexPath.item == 1 {
            let descricaoCell = AppDetalheDescricaoCell(frame: CGRect(x: 0, y: 0, width: width, height: 1000))
            descricaoCell.app = self.app
            descricaoCell.layoutIfNeeded()
            
            let estimativaTamanhoCell = descricaoCell.systemLayoutSizeFitting(CGSize(width: width, height: 100))
            
            height = estimativaTamanhoCell.height
        }
        
        if indexPath.item == 2 {
            height = 550
        }
        
        if indexPath.item == 3 {
            height = 280
        }
        
        return .init(width: width, height: height)
    }
}
