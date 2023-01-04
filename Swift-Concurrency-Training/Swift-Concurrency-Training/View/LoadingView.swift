//
//  LoadingView.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2023/01/04.
//

import SwiftUI

struct LoadingView: View {
    let cancelAction: () -> Void
    var body: some View {
        VStack() {
            ProgressView()
                .scaleEffect(3.0, anchor: .center)
                .progressViewStyle(CircularProgressViewStyle(tint: .orange))
            Button("キャンセル") {
                cancelAction()
            }
            .frame(width: 150, height: 50)
            .foregroundColor(.blue)
            .font(.title2)
            .cornerRadius(5)
            .padding(.top, 80)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(cancelAction: {})
            .previewLayout(.fixed(width: 400, height: 400))
    }
}
