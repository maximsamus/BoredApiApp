//
//  DetailsViewController.swift
//  BoredApiApp
//
//  Created by Максим Самусь on 10.05.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.width / 2
        }
    }
    var character: Results!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchImage(from: character.image) { imageData in
            self.imageView.image = UIImage(data: imageData)
        }
        descriptionLabel.text = character.description
    }
}
