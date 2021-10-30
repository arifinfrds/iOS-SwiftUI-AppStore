//
//  TodayDetailFooterView.swift
//  AppStoreTodayApp
//
//  Created by Arifin Firdaus on 30/10/21.
//

import SwiftUI

struct TodayDetailFooterView: View {
	var body: some View {
		ZStack(alignment: .center) {
			Rectangle()
				.foregroundColor(.white)

			Button(action: {}) {
				HStack {
					Image(systemName: "square.and.arrow.up")
					Text("Share Story")
				}
			}
			.padding()
			.foregroundColor(.accentColor)
			.background(Color(.sRGB, red: 0.95, green: 0.95, blue: 0.95, opacity: 1).cornerRadius(10))
			.overlay(
				RoundedRectangle(cornerRadius: 10)
					.stroke(.white, lineWidth: 1)
			)
		}
	}
}

struct TodayDetailFooterView_Previews: PreviewProvider {
	static var previews: some View {
		TodayDetailFooterView()
	}
}
