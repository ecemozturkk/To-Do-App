//
//  BigButtonView.swift
//  To-Do-App
//
//  Created by Ecem Öztürk on 4.12.2023.
//

import SwiftUI

struct BigButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundStyle(.primary)
                Text(title)
                    .foregroundStyle(.white)
            }
        })
        .frame(width: 300, height: 50)
        .padding(.horizontal)
    }
}

struct BigButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BigButton(title: "Title", action: {})
    }
}
