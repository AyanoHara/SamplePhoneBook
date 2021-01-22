//
//  ProfileCellView.swift
//  SamplePhoneBook
//
//  Created by AYANO HARA on 2021/01/22.
//

import SwiftUI

struct ProfileCellView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 50, height: 80)
            Text("愛知 太郎")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
        }
    }
}

struct ProfileCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCellView()
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
