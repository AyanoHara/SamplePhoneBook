//
//  DecodeType.swift
//  SamplePhoneBook
//
//  Created by AYANO HARA on 2021/03/29.
//

import Foundation

struct ViewHelper {
    // デコードした配列を格納する
    var arrayString: [String] = []
    // デコードした配列をString型にしたものを格納する
    var string: String = ""
    // 住所が複数件存在した時に使うアクションシートフラグ
    var showSheet: Bool = false
   // エラーアラートを表示する時に使うアラートフラグ
    var showAlert: Bool = false
}

enum DecodeType: Int {
    case success = 200
    case notFound = 400
    case serverError = 500
    
    func checkStatus(resultData: AddressData) -> ViewHelper {
        switch self {
        case .success:
            guard let results = resultData.results else {
                return ViewHelper(string: "一致する住所が見つかりませんでした", showAlert: true)
            }
            return decodeData(results: results)
        case .notFound:
            return ViewHelper(string: resultData.message!, showAlert: true)
        case .serverError:
            return ViewHelper(string: resultData.message!, showAlert: true)
        }
    }
    
    func decodeData(results: [Results]) -> ViewHelper {
        switch results.count {
        case 1:
            let addressString = results[0].address1 + results[0].address2 + results[0].address3
            return ViewHelper(string: addressString)
        default:
            var addressStringArray: [String] = []
            for i in 0..<results.count {
                let addressString = results[i].address1 + results[i].address2 + results[i].address3
                addressStringArray.append(addressString)
            }
            return ViewHelper(arrayString: addressStringArray, showSheet: true)
        }
    }
}
