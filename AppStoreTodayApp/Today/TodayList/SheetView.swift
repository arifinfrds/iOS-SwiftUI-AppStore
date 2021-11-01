//
//  SheetView.swift
//  AppStoreTodayApp
//
//  Created by Arifin Firdaus on 01/11/21.
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

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
