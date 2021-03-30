//
//  ProfileEditViewModel.swift
//  SamplePhoneBook
//
//  Created by AYANO HARA on 2021/03/23.
//

import Foundation

class ProfileEditViewModel: ObservableObject {
    
    @Published var addressArrayString: [String?] = []
    @Published var addressString: String = ""  // 初期化する。初期値から変更があった時、非同期で伝播させるため
    @Published var showAlert: Bool = false     // Booleanの場合はfalseを初期値にする。変更があるならtrueでも良い
    
    func fetchAddressData(zipCode: String, updateUi: @escaping() -> Void) {
        let baseUrl = "https://zipcloud.ibsnet.co.jp/api/search"
        guard var components = URLComponents(string: baseUrl) else { return }
        components.queryItems = [URLQueryItem(name: "zipcode", value: zipCode)]
        let request = URLRequest(url: components.url!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let jsonData = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(AddressData.self, from: jsonData)
                DispatchQueue.main.async {
                    guard let results = DecodeType.init(rawValue: decodedData.status) else { return }
                    self.addressArrayString = results.checkStatus(resultData: decodedData)
                    if self.addressArrayString.count == 1 {
                        self.addressString = self.addressArrayString[0] ?? ""
                        print(self.addressString)
                    }
                    updateUi()
                }
                
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
