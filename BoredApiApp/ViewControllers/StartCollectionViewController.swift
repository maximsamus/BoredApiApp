//
//  StartCollectionViewController.swift
//  BoredApiApp
//
//  Created by Максим Самусь on 09.04.2022.
//

import UIKit

class StartCollectionViewController: UICollectionViewController {
    
    private let dataURL = "https://api.genderize.io/?name=scott"
    private let testURL = "https://swiftbook.ru//wp-content/uploads/api/api_course"
    private let dogURL = "https://dog.ceo/api/breeds/image/random"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTest()
        fetchData()
        fetchDog()
    }
    
    private func fetchTest() {
        guard let url = URL(string: testURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No Data")
                return
            }
            do {
                let data = try JSONDecoder().decode(Course.self, from: data)
                print(data)
            } catch let error {
                print ("ERROR IS HERE!!! \(error.localizedDescription)")
            }
        }.resume()
    }
    
    private func fetchData() {
        guard let url = URL(string: dataURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No Data")
                return
            }
            do {
                let data = try JSONDecoder().decode(Scott.self, from: data)
                print(data)
            } catch let error {
                print ("ERROR IS HERE!!! \(error.localizedDescription)")
            }
        }.resume()
    }
    
    
    private func fetchDog() {
        guard let url = URL(string: dataURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No Data")
                return
            }
            do {
                let data = try JSONDecoder().decode(Dog.self, from: data)
                print(data)
            } catch let error {
                print ("ERROR IS HERE!!! \(error.localizedDescription)")
            }
        }.resume()
    }
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        // Configure the cell
        
        return cell
    }
}
// MARK: - UICollectionViewDelegateFlowLayout

extension StartCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
