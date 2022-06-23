//
//  NetworkManager.swift
//  BoredApiApp
//
//  Created by Максим Самусь on 10.04.2022.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    private func getImage(from url: String?, with completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let imageURL = URL(string: url ?? "") else { return }
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(data))
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
    
    func fetchImage(from url: String?, with completion: @escaping(UIImage) -> Void) {
        guard let imageURL = URL(string: url ?? "") else { return }
        if let cacheImage = ImageCache.shared.object(forKey: imageURL.lastPathComponent as NSString) {
            completion(cacheImage)
            return
        }
        
        getImage(from: url) { result in
            switch result {
            case .success(let imageData):
                guard let image = UIImage(data: imageData) else { return }
                ImageCache.shared.setObject(image, forKey: imageURL.lastPathComponent as NSString)
                completion(image)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    enum NetworkError: Error {
        case invalidURL
        case noData
        case decodingError
    }
}
