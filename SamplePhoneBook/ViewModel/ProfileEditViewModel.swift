//
//  ProfileEditViewModel.swift
//  SamplePhoneBook
//
//  Created by AYANO HARA on 2021/03/23.
//

import Foundation

class ProfileEditViewModel: ObservableObject {
    
    @Published var addressString: String = ""  // 初期化する。初期値から変更があった時、非同期で伝播させるため
    @Published var showAlert: Bool = false     // Booleanの場合はfalseを初期値にする。変更があるならtrueでも良い
    
    enum DecodeType: Int {
        case success = 200
        case notFound = 400
        case serverError = 500
        
        func checkStatus(resultData: AddressData) -> [String] {
            switch self {
            case .success:
                return decodeData(resultData: resultData)
            case .notFound:
                return [resultData.message!]
            case .serverError:
                return [resultData.message!]
            }
        }
        
        func decodeData(resultData: AddressData) -> [String]{
            guard let results = resultData.results else { return ["一致する住所が見つかりません。"] }
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
    
    func fetchAddressData(zipCode: String, updateUi: @escaping() -> Void) {
        let baseUrl = "https://zipcloud.ibsnet.co.jp/api/search"
        guard var components = URLComponents(string: baseUrl) else { return }
        components.queryItems = [URLQueryItem(name: "zipcode", value: zipCode)]
        let request = URLRequest(url: components.url!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let jsonData = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(AddressData.self, from: jsonData)
//                print(DecodeType.init(rawValue: decodedData.status)?.checkStatus(resultData: decodedData) as Any)
                
                DispatchQueue.main.async {
                    guard let results = DecodeType.init(rawValue: decodedData.status) else { return }
                    
                    self.addressString = results.checkStatus(resultData: decodedData)[0]
                    print(self.addressString)
                    updateUi()
                }
                
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
