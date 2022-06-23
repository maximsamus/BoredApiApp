//
//  CharacterTableViewController.swift
//  BoredApiApp
//
//  Created by Максим Самусь on 10.05.2022.
//

import UIKit

class CharacterTableViewController: UITableViewController {
    
    private var rickAndMorty: RickAndMorty?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(from: Link.rickAndMortyApi.rawValue)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rickAndMorty?.results?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? StartViewCell else { return UITableViewCell() }
        guard let character = rickAndMorty?.results?[indexPath.row] else { return UITableViewCell() }
        cell.configure(with: character)
        cell.updateImage(with: character)
        return cell
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { rickAndMorty in
            self.rickAndMorty = rickAndMorty
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let detailVC = segue.destination as? DetailsViewController else { return }
        guard let character = rickAndMorty?.results?[indexPath.row] else { return }
        detailVC.character = character
    }
    
    @IBAction func updateData(_ sender: UIBarButtonItem) {
        sender.tag == 1
        ? fetchData(from: rickAndMorty?.info?.next)
        : fetchData(from: rickAndMorty?.info?.prev)
    }
}
