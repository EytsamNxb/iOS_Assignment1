//
//  ProductRow.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 15/11/2023.
//

import SwiftUI

struct ProductRow: View {
    var product: Product
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                HStack(spacing: 20) {
                    if let thumbnails = product.thumbnailUrls, let thumbnail = thumbnails.first {
                        AsyncImage(url: URL(string: thumbnail)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle()) // Clip the image into a circular shape
                                .frame(width: 50, height: 50)
                        } placeholder: {
                            ProgressView().progressViewStyle(.circular).padding()
                        }.frame(width: 50,height: 50)
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text(product.name ?? "No name")
                            .font(.system(size: 16).weight(.medium))
                            .lineLimit(1)
                        Text(product.price ?? "No price")
                            .font(.system(size: 14).weight(.regular))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
            }.padding()
                .background(Color.gray.opacity(0.4))
        }.clipShape(RoundedRectangle(cornerRadius: 5.0))
    }
}

//#Preview {
//    ProductRow()
//}
