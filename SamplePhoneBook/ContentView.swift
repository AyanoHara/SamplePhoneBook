//
//  ContentView.swift
//  SamplePhoneBook
//
//  Created by AYANO HARA on 2021/01/14.
//

import SwiftUI

struct ContentView: View {
    
    let coloredNavAppearance = UINavigationBarAppearance()
    
    init() {
        //NavigationBarの背景色を設定
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = #colorLiteral(red: 0.3406455969, green: 0.7038961086, blue: 0.9686274529, alpha: 1)
        //NavigationBarのtextの色を設定
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
    }
    
    var body: some View {
        TabView {
            NavigationView {
                ZStack {
                    Color(#colorLiteral(red: 0.5974730564, green: 0.799616446, blue: 0.9255421162, alpha: 1))
                }
                .navigationBarItems(leading: Image(systemName: "list.dash"))
                .navigationBarTitle("プロフィール一覧", displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "list.dash")
                    .foregroundColor(.black)
                Text("プロフィール一覧")
            }.tag(1)
            
            NavigationView {
                ZStack {
                    Color(#colorLiteral(red: 0.5974730564, green: 0.799616446, blue: 0.9255421162, alpha: 1))
                }
                .navigationBarItems(leading: Image(systemName: "person.circle.fill"))
                .navigationBarTitle("プロフィール登録", displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "person.circle.fill")
                    .foregroundColor(.black)
                Text("プロフィール登録")
            }.tag(2)
        }
        // 選択したアイテム色を指定
        .accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
