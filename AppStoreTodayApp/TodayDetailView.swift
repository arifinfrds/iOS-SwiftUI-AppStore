//
//  TodayDetailView.swift
//  AppStoreTodayApp
//
//  Created by Arifin Firdaus on 30/10/21.
//

import SwiftUI

struct TodayDetailView: View {

	@Environment(\.presentationMode) var presentationMode

	var body: some View {
		NavigationView {
			GeometryReader { proxy in
				ScrollView {
					VStack {
						Image(systemName: "")
							.resizable()
							.frame(width: proxy.size.width, height: 300, alignment: .center)
							.background(Color.blue)

						VStack(alignment: .leading, spacing: 10) {
							Text(anyText())
							TodayDetailFooterView()
								.frame(width: proxy.size.width, height: 150, alignment: .center)
						}
					}
				}
			}
			.navigationBarTitle(Text("Detail"), displayMode: .inline)
			.navigationBarItems(trailing: BarButtonItemView(onTapView: {
				presentationMode.wrappedValue.dismiss()
			}))
		}
	}
}

struct TodayDetailView_Previews: PreviewProvider {
	static var previews: some View {
		TodayDetailView()
			.previewLayout(.sizeThatFits)
	}
}

private extension TodayDetailView {

	func anyText() -> String {
		return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ac magna quis mi condimentum gravida vitae vitae leo. Pellentesque aliquet semper dui, at bibendum nisi pharetra et. Curabitur a suscipit augue. Integer lobortis ex et faucibus tempor. In non libero a tortor ultrices euismod ac ut ipsum. Nunc tempor fringilla semper. Mauris aliquam urna sed pulvinar feugiat. \n \nMauris elit nisl, sollicitudin ac finibus ut, venenatis et dui. Suspendisse sit amet mi est. Fusce venenatis dapibus aliquet. Donec finibus tristique augue ac ultrices. Vivamus mattis leo ut velit tincidunt, at ornare quam gravida. Aenean id felis venenatis, viverra nulla sit amet, molestie justo. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer aliquam metus purus, ut dignissim magna feugiat at. Suspendisse quis tellus placerat, rhoncus dui scelerisque, malesuada risus."
	}
}
