//
//  ApiData.swift
//  BoredApiApp
//
//  Created by Максим Самусь on 09.04.2022.
//

//struct Data: Decodable {
//    let activity: String
//    let type: String
//    let participants: Int
//    let price: Double
//    let link: String
//    let key: String
//    let accessibility: Double
//}

struct Scott: Decodable {
    let name: String?
    let gender: String?
    let probability: Float?
    let count: Int?
}

struct Course: Decodable {
    let name: String?
    let imageUrl: String?
    let number_of_lessons: Int?
    let number_of_tests: Int?
}

struct Dog: Decodable {
    let message: String?
    let status: String?
    
}
