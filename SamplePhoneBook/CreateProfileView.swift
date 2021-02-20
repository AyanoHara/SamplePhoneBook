//
//  ResistProfileView.swift
//  SamplePhoneBook
//
//  Created by AYANO HARA on 2021/01/21.
//

import SwiftUI

struct CreateProfileView: View {
    
    @State private var name = ""
    @State private var phoneNumString = ""
    @State private var postalCode = ""
    @State private var address = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                TextField("氏名を入力", text: $name)
                    .font(.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 1)
                    )
                    .padding(5)
                TextField("電話番号を入力", text: $phoneNumString)
                    .font(.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 1)
                    )
                    .padding(5)
                HStack {
                    TextField("郵便番号を入力", text: $postalCode)
                        .font(.title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 1)
                        )
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("検索")
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                            .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 1)
                            )
                    }
                }
                .padding(5)
                TextField("住所を入力", text: $address)
                    .font(.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 1)
                    )
                    .padding(5)
                Button(action: {
                    print("ボタンが押されました！！")
                }) {
                    Text("登録する")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                        .background(Color(#colorLiteral(red: 0.01002341509, green: 0.9769298434, blue: 0.4756181836, alpha: 1)))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 1)
                        )
                }
                .disabled(name.isEmpty || phoneNumString.isEmpty || address.isEmpty)
                .padding(5)
                Spacer()
            }
            .padding()
            //背景色の設定
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity)
            .background(Color(#colorLiteral(red: 0.5974730564, green: 0.799616446, blue: 0.9255421162, alpha: 1)))
            //NavigationBarの設定
            .navigationBarItems(leading: Image(systemName: "person.circle.fill"))
            .navigationBarTitle("プロフィール登録", displayMode: .inline)
        }
    }
}

struct ResistProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
    }
}
