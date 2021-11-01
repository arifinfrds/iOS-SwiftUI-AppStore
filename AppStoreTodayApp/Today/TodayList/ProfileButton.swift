//
//  ProfileButton.swift
//  AppStoreTodayApp
//
//  Created by Arifin Firdaus on 29/10/21.
//

import SwiftUI

struct ProfileButton: View {
	
	var onTapView: (() -> Void)?
	
	var body: some View {
		Button {
			onTapView?()
		} label: {
			Image(systemName: "person.fill")
				.resizable()
				.renderingMode(.original)
				.frame(width: 18, height: 18, alignment: .center)
				.padding(.all, 8)
				.overlay(Circle().stroke())
		}
	}
}

struct ProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButton()
    }
}
