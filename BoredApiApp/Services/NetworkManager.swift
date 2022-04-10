//
//  NetworkManager.swift
//  BoredApiApp
//
//  Created by Максим Самусь on 10.04.2022.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    private let dataURL = "https://api.genderize.io/?name=scott"
    private var dataScott: Scott?
    
    func fetchData(from model: Scott, completion: @escaping () -> Void) {
        guard let url = URL(string: dataURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No Data")
                return
            }
            do {
                self.dataScott = try JSONDecoder().decode(Scott.self, from: data)
                print(self.dataScott ?? "")
                //                DispatchQueue.main.async {
                //                    self.collectionView.reloadData()
                //                }
            } catch let error {
                print ("ERROR IS HERE!!! \(error.localizedDescription)")
            }
            
        }.resume()
    }
    private init() {}
}
