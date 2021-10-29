//
//  TodayView.swift
//  AppStoreTodayApp
//
//  Created by Arifin Firdaus on 29/10/21.
//

import SwiftUI

struct TodayView: View {
	var body: some View {
		NavigationView {
			GeometryReader { proxy in
				List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
					TodayCell()
						.frame(width: .infinity, height: 450, alignment: .center)
				}
				.listStyle(PlainListStyle())
			}
			.navigationBarTitle(Text("Today"), displayMode: .large)
		}
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
		TodayView()
			.previewDevice("iPhone 13 mini")
    }
}
