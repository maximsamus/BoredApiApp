//
//  ApiData.swift
//  BoredApiApp
//
//  Created by Максим Самусь on 09.04.2022.
//

enum Link: String {
    case rickAndMortyApi = "https://rickandmortyapi.com/api/character"
}

struct RickAndMorty: Codable {
    let info: Info?
    let results: [Results]?
}

struct Info: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

struct Results: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let origin: Origin?
    let location: Loction?
    let image: String?
    let episode: [String]?
    let url: String?
    
    var description: String {
        """
        Name: \(name ?? "")
        Status: \(status ?? "")
        Species: \(species ?? "")
        Gender: \(gender ?? "")
        Origin: \(origin?.name ?? "")
        Location: \(location?.name ?? "")
        """
    }
}

struct Origin: Codable {
    let name: String?
    let url: String?
}

struct Loction: Codable {
    let name: String?
    let url: String?
}

struct Episode: Codable {
    let id: Int?
    let name: String?
    let air_date: String?
    let episode: [String]?
    let created: String?
    
    var description: String {
        """
       Name: \(name ?? "")
       Air date: \(air_date ?? "")
       Created: \(created ?? "")
       """
    }
}
