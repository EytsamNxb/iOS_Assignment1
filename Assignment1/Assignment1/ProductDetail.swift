//
//  ProductDetail.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 15/11/2023.
//

import SwiftUI
import NukeUI

struct ProductDetail: View {
   var product: ProductModel
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                if let image = product.image_urls, let displayImage = image.first {
                    LazyImage(url: URL(string: displayImage)) { state in
                        if state.isLoading {
                            VStack {
                                HStack {
                                    Spacer()
                                    ProgressView().progressViewStyle(.circular).padding()
                                    Spacer()
                                }
                            }
                        } else if let image = state.image {
                            image
                                .resizable()
                                .frame(height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 5.0))
                        }
                    }.frame(height: 200)
                }
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(product.name ?? "No name")
                            .font(.system(size: 16).weight(.bold))
                            .fixedSize(horizontal: false, vertical: true)
                        Text(product.price ?? "No price")
                            .font(.system(size: 14).weight(.regular))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Spacer()
                }
                Spacer()
                
            }.padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
