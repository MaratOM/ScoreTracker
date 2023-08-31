//
//  StatisticsScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 29.08.2023.
//

import SwiftUI

struct StatisticsScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Statistics")
                    .font(.system(size: 30))
                    .padding(.bottom, 16)
                Image(systemName: "chart.bar.xaxis")
                    .font(.system(size: 50))
            }
            .navigationTitle("Players")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct StatisticsScreen_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsScreen()
    }
}
