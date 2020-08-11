//
//  DataResponse.swift
//  MapONNTest
//
//  Created by Abhinav Verma on 11/08/20.
//  Copyright © 2020 Abhinav Verma. All rights reserved.
//

import Foundation

// MARK: - DataResponse
struct DataResponse: Codable {
    let status: Bool?
    let code: Int?
    let message: String?
    let data: [Datum]?
}

// MARK: - Datum
struct Datum: Codable {
    let productID, name, thumb: String?
    let image: String?
    let datumDescription, price: String?
    let weight: Int?
    let unit: String?
    let special, save, offer: String?
    let tax: Bool?
    let minimum: Int?
    let stock: Bool?
    let rating, dffCleaned: Int?
    let discounts: [Discount]?
    let href: String?

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case name, thumb, image
        case datumDescription = "description"
        case price, weight, unit, special, save, offer, tax, minimum, stock, rating
        case dffCleaned = "dff_cleaned"
        case discounts, href
    }
}

// MARK: - Discount
struct Discount: Codable {
    let quantity, price, special, save: String?
    let offer: String?
    let weight: Int?
    let unit: String?
    let tax: Bool?
}

//enum Unit: String, Codable {
//    case g = "g"
//    case kg = "kg"
//
//}
