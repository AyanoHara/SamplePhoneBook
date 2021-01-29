//
//  ProfileListView.swift
//  SamplePhoneBook
//
//  Created by AYANO HARA on 2021/01/21.
//

import SwiftUI

struct ProfileListView: View {
    
    var phoneData = ["愛知 太郎",
                     "愛知 花子",
                     "沖縄 太郎",
                     "沖縄 花子",
                     "千葉 太郎",
                     "愛知 太郎",
                     "愛知 花子",
                     "沖縄 太郎",
                     "沖縄 花子",
                     "千葉 太郎",
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                //セルの再利用(LazyVStack)
                LazyVStack {
                    ForEach(0..<phoneData.count) { num in
                        ProfileCellView(name: phoneData[num])
                            .padding(5)
                    }
                }
            }
            .padding()
            //背景色の設定
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity)
            .background(Color(#colorLiteral(red: 0.5974730564, green: 0.799616446, blue: 0.9255421162, alpha: 1)))
            //NavigationBarの設定
            .navigationBarItems(leading: Image(systemName: "list.dash"))
            .navigationBarTitle("プロフィール一覧", displayMode: .inline)
        }
    }
}

struct ProfileListView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileListView()
    }
}
