//
//  AppsVC.swift
//  App Store
//
//  Created by Lucas Sesti on 24/09/20.
//

import UIKit

class AppsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let headerId = "headerId"
    var appsEmDestaque: [AppDestaque] = []
    var appsGrupos: [AppGrupo] = []
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .large)
        ai.color = UIColor.gray
        ai.startAnimating()
        ai.hidesWhenStopped = true
        return ai
    }()
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        collectionView.backgroundColor = .white
        collectionView.register(AppsGrupoCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(AppsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centralizarSuperView()
        
        self.buscaApps()
    }
}

extension AppsVC {
    func buscaApps() {
        
        var appsEmDestaque: [AppDestaque]?
        var appsQueAmamos: AppGrupo?
        var topAppsPagos: AppGrupo?
        var topAppsGratis: AppGrupo?
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        AppsService.shared.searchWantedApps { (apps, err) in
            appsEmDestaque = apps
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        AppsService.shared.buscaGrupo(type: "apps-que-amamos") { (apps, err) in
            appsQueAmamos = apps
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        AppsService.shared.buscaGrupo(type: "top-apps-pagos") { (apps, err) in
            topAppsPagos = apps
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        AppsService.shared.buscaGrupo(type: "top-apps-gratis") { (apps, err) in
            topAppsGratis = apps
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            
            if let apps = appsEmDestaque {
                self.appsEmDestaque = apps
            }
            
            if let apps = appsQueAmamos {
                self.appsGrupos.append(apps)
            }
            
            if let apps = topAppsPagos {
                self.appsGrupos.append(apps)
            }
            
            if let apps = topAppsGratis {
                self.appsGrupos.append(apps)
            }
            
            self.activityIndicatorView.stopAnimating()
            self.collectionView.reloadData()
            
        }
        
    }
    //    func searchWantedApps() {
    //        AppsService.shared.searchWantedApps { (apps, err) in
    //            if let err = err {
    //                print(err)
    //                return
    //            }
    //
    //            if let apps = apps {
    //                DispatchQueue.main.async {
    //                    self.appsEmDestaque = apps
    //                    self.collectionView.reloadData()
    //                }
    //            }
    //        }
    //    }
    //
    
    extension AppsVC {
        
        override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsHeader
            
            if self.appsEmDestaque.count >= 3 {
                header.appsEmDestaque = Array(self.appsEmDestaque[0 ..< 3])
            } else {
                header.appsEmDestaque = self.appsEmDestaque
            }
            
            header.collectionView.reloadData()
            return header
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return .init(width: view.bounds.width, height: view.bounds.width * 0.8)
        }
        
        // Depois do header
        
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.appsGrupos.count
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return .init(top: 20, left: 0, bottom: 20, right: 0)
        }
        
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGrupoCell
            
            cell.grupo = self.appsGrupos[indexPath.item]
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return .init(width: view.bounds.width, height: 280)
        }
    }
