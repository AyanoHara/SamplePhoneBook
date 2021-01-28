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
                .frame(width: 70, height: 70)
            Text("愛知 太郎")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
        }
        .padding()
        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        .cornerRadius(20)
        .shadow(color: .gray, radius: 3, x: 10, y: 10)
        
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 1)
        )
    }
}

struct ProfileCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCellView()
            .previewLayout(.fixed(width: 300, height: 100))
            .padding()
    }
}
