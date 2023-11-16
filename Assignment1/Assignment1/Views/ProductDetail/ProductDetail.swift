//
//  ProductDetail.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 15/11/2023.
//

import SwiftUI

struct ProductDetail: View {
   var product: Product
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 10) {
                if let image = product.imageUrls, let displayImage = image.first {
                    AsyncImage(url: URL(string: displayImage)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    } placeholder: {
                        ProgressView().progressViewStyle(.circular).padding()
                    }.frame(height: 200)
                }
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(product.name ?? "No name")
                            .font(.system(size: 18).weight(.bold))
                            .fixedSize(horizontal: false, vertical: true)
                        Text(product.price ?? "No price")
                            .font(.system(size: 14).weight(.regular))
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                    }
                }
                Spacer()
                
            }.padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
