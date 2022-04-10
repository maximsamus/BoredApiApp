//
//  StartViewCell.swift
//  BoredApiApp
//
//  Created by Максим Самусь on 10.04.2022.
//

import UIKit

class StartViewCell: UICollectionViewCell {
    
    @IBOutlet var dataLabel: UILabel!
    
    func configure(with scott: Scott) {
        dataLabel.text = "\(scott.name ?? "")"
    }
}
