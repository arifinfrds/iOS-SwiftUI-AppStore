//
//  TodayView.swift
//  AppStoreTodayApp
//
//  Created by Arifin Firdaus on 29/10/21.
//

import SwiftUI

struct SheetView: View {
	@Environment(\.presentationMode) var presentationMode

	var body: some View {
		Button("Press to dismiss") {
			presentationMode.wrappedValue.dismiss()
		}
		.font(.title)
		.padding()
		.background(Color.black)
	}
}


struct TodayView: View {

	@State private var shouldShowSheet = false

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
			.navigationBarItems(
				trailing: ProfileButton(onTapView: {
					shouldShowSheet = true
				})
			)
			.sheet(isPresented: $shouldShowSheet, content: {
				SheetView()
			})
		}
	}
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
		TodayView()
			.previewDevice("iPhone 13 mini")
    }
}
