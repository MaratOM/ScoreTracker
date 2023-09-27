//
//  StatisticsScreen.swift
//  ScoreCounter
//
//  Created by Marat Mikaelyan on 29.08.2023.
//

import SwiftUI
import UIDesignSystem

struct StatisticsScreen: View {
    @EnvironmentObject var store: ScoreCounterStore

    var body: some View {
        NavigationView {
            ZStack {
                Backgrounds.main.view

                VStack {
                    Texts.h1("Statistics").view
                        .padding(.bottom, 16)
                    Image(systemName: "chart.bar.xaxis")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(store.palette.colors.fifth)
                }
                .navigationTitle("Players")
            .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct StatisticsScreen_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsScreen()
            .environmentObject(ScoreCounterStore())
    }
}
