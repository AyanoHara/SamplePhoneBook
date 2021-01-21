//
//  ProfileListView.swift
//  SamplePhoneBook
//
//  Created by AYANO HARA on 2021/01/21.
//

import SwiftUI

struct ProfileListView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.5974730564, green: 0.799616446, blue: 0.9255421162, alpha: 1))
            }
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
