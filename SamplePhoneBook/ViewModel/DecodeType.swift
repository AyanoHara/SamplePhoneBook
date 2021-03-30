//
//  DecodeType.swift
//  SamplePhoneBook
//
//  Created by AYANO HARA on 2021/03/29.
//

import Foundation

enum DecodeType: Int {
    case success = 200
    case notFound = 400
    case serverError = 500
    
    func checkStatus(resultData: AddressData) -> [String?] {
        switch self {
        case .success:
            return decodeData(resultData: resultData)
        case .notFound:
            return [resultData.message!]
        case .serverError:
            return [resultData.message!]
        }
    }
    
    func decodeData(resultData: AddressData) -> [String?]{
        guard let results = resultData.results else {
            print("一致する住所が見つかりません")
            return [nil]
        }
        switch results.count {
        case 1:
            let addressString = results[0].address1 + results[0].address2 + results[0].address3
            return [addressString]
        default:
            var addressStringArray: [String] = []
            for i in 0..<results.count {
                let addressString = results[i].address1 + results[i].address2 + results[i].address3
                addressStringArray.append(addressString)
            }
            return addressStringArray
        }
    }
}
