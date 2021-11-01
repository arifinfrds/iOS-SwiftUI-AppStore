//
//  TodayCell.swift
//  AppStoreTodayApp
//
//  Created by Arifin Firdaus on 29/10/21.
//

import SwiftUI

struct TodayCell: View {

	var onTapCell: (() -> Void)

	var body: some View {
		GeometryReader { proxy in
			// Cell
			VStack {

				// ContentView
				VStack(alignment: .leading, spacing: 10.0) {

					Text("LIFE HACK")
						.font(.headline)
						.fontWeight(.semibold)
						.foregroundColor(.secondary)

					Text("Protect your data, \nprotect yourself")
						.font(.title3)
						.fontWeight(.bold)
						.foregroundColor(.primary)
						.lineLimit(2)

					Image(systemName: "person.fill")
						.resizable()
						.frame(width: .infinity, height: 250, alignment: .center)

					Text("Keep all your info safe with these handy apps.")
						.font(.body)
						.foregroundColor(.secondary)
						.lineLimit(2)
				}
				.padding()

			}
			.overlay(
				RoundedRectangle(cornerRadius: 8)
					.stroke(Color.secondary, lineWidth: 0.25)
			)
			.onTapGesture(perform: onTapCell)
		}
	}
}

struct TodayCell_Previews: PreviewProvider {
	static var previews: some View {
		TodayView()
			.previewDevice("iPhone 13 mini")
		TodayView()
			.previewDevice("iPhone 13 Pro Max")
	}
}
