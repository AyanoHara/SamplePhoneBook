//
//  AddressData.swift
//  SamplePhoneBook
//
//  Created by AYANO HARA on 2021/03/23.
//

import Foundation

struct AddressData: Decodable {
    let message: String?
    let status: Int
    let results: [Results]?
}

struct Results: Decodable {
    let address1: String
    let address2: String
    let address3: String
    let kana1: String
    let kana2: String
    let kana3: String
    let prefcode: String
    let zipcode: String
}
