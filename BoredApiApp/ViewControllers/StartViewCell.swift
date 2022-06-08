//
//  StartViewCell.swift
//  BoredApiApp
//
//  Created by Максим Самусь on 10.04.2022.
//

import UIKit

class StartViewCell: UITableViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(with character: Results) {
        nameLabel.text = character.name
        NetworkManager.shared.fetchImage(from: character.image) { imageData in
            self.characterImageView.image = UIImage(data: imageData)
            }
        }
    }

