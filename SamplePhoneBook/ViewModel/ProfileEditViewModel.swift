//
//  ProfileEditViewModel.swift
//  SamplePhoneBook
//
//  Created by AYANO HARA on 2021/03/23.
//

import Foundation

class ProfileEditViewModel: ObservableObject {
    
    @Published var viewHelper: ViewHelper = ViewHelper()
    
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
                    self.viewHelper = results.checkStatus(resultData: decodedData)
                    updateUi()
                }
                
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
