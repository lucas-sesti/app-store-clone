//
//  AppsService.swift
//  App Store
//
//  Created by Lucas Sesti on 24/09/20.
//

import Foundation

class AppsService {
    
    static let shared = AppsService()
    
    let API = "https://api.euprogramador.app/app-store/v1/"
    
    func searchWantedApps(completion: @escaping ([AppDestaque]?, Error?) -> ()) {
        guard let url = URL(string: "\(API)apps/apps-em-destaque") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            if let err = err {
                completion(nil, err)
                return
            }
            
            do {
                guard let data = data else { return }
                
                let apps = try JSONDecoder().decode([AppDestaque].self, from: data)
                completion(apps, nil)
                
            } catch let err {
                completion(nil, err)
                return
            }
        }.resume()
    }
    
    func buscaGrupo(type: String, completion: @escaping (AppGrupo?, Error?) -> ()) {
        guard let url = URL(string: "\(API)apps/\(type)") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            
            do {
                guard let data = data else { return }
                
                let apps = try JSONDecoder().decode(AppGrupo.self, from: data)
                completion(apps, nil)
                
            } catch let err {
                completion(nil, err)
                return
            }
        }.resume()
    }
    
    func buscaAppId(appId: Int, completion: @escaping (App?, Error?) -> ()) {
        guard let url = URL(string: "\(API)apps/\(appId)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            
            do {
                guard let data = data else { return }
                
                let app = try JSONDecoder().decode(App.self, from: data)
                completion(app, nil)
                
            } catch let err {
                completion(nil, err)
                return
            }
        }.resume()
    }
}
