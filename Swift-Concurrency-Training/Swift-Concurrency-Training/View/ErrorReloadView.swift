//
//  ErrorReloadView.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2023/01/04.
//

import SwiftUI

struct ErrorReloadView: View {
    let reloadAction: () -> Void
    let errorMessage: String
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "xmark.octagon.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.top, 20)
            Text("エラー")
                .font(.largeTitle)
            Button("再読み込み") {
                reloadAction()
            }
            .frame(width: 150, height: 50)
            .background(.blue)
            .foregroundColor(.white)
            .font(.title3)
            .cornerRadius(5)
            Text(errorMessage)
                .padding(.top, 50)
            Spacer()
        }
    }
}

struct ErrorReloadView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorReloadView(reloadAction: {}, errorMessage: "")
            .previewLayout(.fixed(width: 400, height: 400))
    }
}
