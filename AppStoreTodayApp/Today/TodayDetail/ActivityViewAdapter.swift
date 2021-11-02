//
//  ActivityViewAdapter.swift
//  AppStoreTodayApp
//
//  Created by Arifin Firdaus on 02/11/21.
//

import UIKit
import SwiftUI

struct ActivityViewAdapter: UIViewControllerRepresentable {
	let activityItems: [Any]
	let applicationActivities: [UIActivity]?

	func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewAdapter>) -> some UIActivityViewController {
		let controller = UIActivityViewController(
			activityItems: activityItems,
			applicationActivities: applicationActivities
		)
		return controller
	}

	func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}

