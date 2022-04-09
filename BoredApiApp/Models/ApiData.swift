//
//  ApiData.swift
//  BoredApiApp
//
//  Created by Максим Самусь on 09.04.2022.
//

struct Data: Decodable {
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
    let accessibility: Double
}

//struct Weather: Decodable {
//    let month: String
//    let num: String
//    let link: String
//    let year: String
//    let news: String
//    let safe_title: String
//    let transcript: String
//    let alt: String
//    let img: String
//    let title: String
//    let day: String
//}
