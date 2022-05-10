//
//  NetworkManager.swift
//  BoredApiApp
//
//  Created by Максим Самусь on 10.04.2022.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    //    private let dataURL = "https://api.genderize.io/?name=scott"
    //    private var dataScott: Scott?
    
    private init() {}
    
    //    func fetchData(from model: Scott, completion: @escaping () -> Void) {
    //        guard let url = URL(string: dataURL) else { return }
    //
    //        URLSession.shared.dataTask(with: url) { data, _, error in
    //            guard let data = data else {
    //                print(error?.localizedDescription ?? "No Data")
    //                return
    //            }
    //            do {
    //                self.dataScott = try JSONDecoder().decode(Scott.self, from: data)
    //                print(self.dataScott ?? "")
    //                //                DispatchQueue.main.async {
    //                //                    self.collectionView.reloadData()
    //                //                }
    //            } catch let error {
    //                print ("ERROR IS HERE!!! \(error.localizedDescription)")
    //            }
    //
    //        }.resume()
    //    }
    
    func fetchRickAndMorty(from url: String?, with completion: @escaping(RickAndMorty) -> Void) {
        guard let url = URL(string: Link.rickAndMortyApi.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let result = try JSONDecoder().decode(RickAndMorty.self, from: data)
                DispatchQueue.main.async {
                    print(result)
                    
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func fetchData(from url: String?, with completion: @escaping(RickAndMorty) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let rickAndMorty = try JSONDecoder().decode(RickAndMorty.self, from: data)
                DispatchQueue.main.async {
                    completion(rickAndMorty)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func fetchImage1 (from url: String?, with completion: @escaping(UIImage) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
    func fetchImage(from url: String?, with completion: @escaping(Data) -> Void) {
        guard let stringURL = url else { return }
        guard let imageURL = URL(string: stringURL) else { return }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: imageURL) else { return }
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
    
    func fetchCharacter(from url: String?, with completion: @escaping(Results) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Results.self, from: data)
                DispatchQueue.main.async {
                    completion(result)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func fetchEpisode(from url: String, completion: @escaping(Result<Episode, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "no description")
                return
            }
            do {
                let episode = try JSONDecoder().decode(Episode.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(episode))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    enum NetworkError: Error {
        case invalidURL
        case noData
        case decodingError
    }
}
