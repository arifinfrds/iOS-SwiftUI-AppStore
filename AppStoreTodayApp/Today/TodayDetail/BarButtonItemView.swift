//
//  BarButtonItemView.swift
//  AppStoreTodayApp
//
//  Created by Arifin Firdaus on 30/10/21.
//

import SwiftUI

struct BarButtonItemView: View {

	var onTapView: (() -> Void)?

    var body: some View {
			Button(action: { onTapView?() }) {
				Image(systemName: "xmark.circle.fill")
					.resizable()
					.frame(width: 24, height: 24, alignment: .center)
					.foregroundColor(.gray)
			}
    }
}

struct BarButtonItemView_Previews: PreviewProvider {
    static var previews: some View {
        BarButtonItemView()
    }
}
