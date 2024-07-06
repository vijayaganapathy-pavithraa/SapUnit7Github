//
//  FeedbackResponseView.swift
//  jokesApp
//
//  Created by Vijayaganapathy Pavithraa on 29/6/24.
//

import SwiftUI

struct FeedbackResponseView: View {
    var isPositive : Bool
    var body: some View {
        Image(isPositive ? "happy": "sad")
            .resizable()
            .scaledToFit()
        Text(isPositive ? "Thanks, here's a cookie 🍪!" :
                "Very mean. I will bite you.")
            .padding()
    }
}

#Preview {
    FeedbackResponseView(isPositive: true)
}
