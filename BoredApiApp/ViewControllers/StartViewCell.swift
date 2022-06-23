//
//  StartViewCell.swift
//  BoredApiApp
//
//  Created by Максим Самусь on 10.04.2022.
//

import UIKit

class StartViewCell: UITableViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView! {
        didSet {
            characterImageView.layer.cornerRadius = 15
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    private var imageUrl: URL? {
        didSet {
            characterImageView.image =  nil
        }
    }
    
    func updateImage(with character: Results) {
        guard let url = imageUrl?.absoluteString else { return }
        NetworkManager.shared.fetchImage(from: url) { image in
            if URL(string: url) == self.imageUrl {
                self.characterImageView.image = image
            }
        }
    }
    
    func configure(with character: Results) {
        nameLabel.text = character.name
        imageUrl = URL(string: character.image ?? "")
    }
}

