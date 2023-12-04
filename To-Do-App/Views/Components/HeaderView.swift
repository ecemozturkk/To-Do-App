//
//  HeaderView.swift
//  To-Do-App
//
//  Created by Ecem Öztürk on 4.12.2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            Image("rooster")
                .resizable()
                .frame(width: 120, height: 135)
            Text("To Do")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .padding(.top, 30)
        }.padding(.top, 100)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
