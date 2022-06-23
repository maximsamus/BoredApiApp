//
//  DetailsViewController.swift
//  BoredApiApp
//
//  Created by Максим Самусь on 10.05.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var imageView: UIImageView! 
    
    var character: Results!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchImage(from: character.image) { image in
            self.imageView.image = image
        }
        descriptionLabel.text = character.description
    }
}
