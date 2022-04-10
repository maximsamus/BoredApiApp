//
//  StartCollectionViewController.swift
//  BoredApiApp
//
//  Created by Максим Самусь on 09.04.2022.
//

import UIKit

class StartCollectionViewController: UICollectionViewController {
    
    private var dataScott: Scott?
    
    private let dataURL = "https://api.genderize.io/?name=scott"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    private func fetchData() {
        guard let url = URL(string: dataURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No Data")
                return
            }
            do {
                self.dataScott = try JSONDecoder().decode(Scott.self, from: data)
                                print(self.dataScott ?? "")
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch let error {
                print ("ERROR IS HERE!!! \(error.localizedDescription)")
            }
        }.resume()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? StartViewCell else {
            return UICollectionViewCell()
        }
        if let scott = dataScott {
        cell.configure(with: scott)
            print(scott)
        }
        return cell
    }
    
}
// MARK: - UICollectionViewDelegateFlowLayout

extension StartCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 200)
    }
}
