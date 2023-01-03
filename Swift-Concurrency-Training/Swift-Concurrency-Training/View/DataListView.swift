//
//  DataListView.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/09/09.
//

import SwiftUI

struct DataListView: View {
    @StateObject var viewModel = DataListViewModel()
    
    var body: some View {
        NavigationView {
            switch viewModel.viewState {
            case .completed, .initialized:
                List(viewModel.dataList) { data in
                    Text(data.name)
                }
                .onAppear {
                    viewModel.onAppear()
                }
                .navigationTitle("User List")
            case .failed:
                VStack(spacing: 20) {
                    Image(systemName: "xmark.octagon.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text("エラー")
                        .font(.largeTitle)
                    Button("再読み込み") {
                        print("読み込み")
                    }
                    .frame(width: 150, height: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    .font(.title3)
                    .cornerRadius(5)
                    Text("読み込み中に問題が発生しました。\n再度読み込みを行なってください。")
                        .padding(.top, 50)
                    Spacer()
                }
            }
        }
    }
}

struct DataListView_Previews: PreviewProvider {
    static var previews: some View {
        Group { // 複数端末でpreview見る
            DataListView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
                .previewDisplayName("iPhone 13")
            DataListView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE（3rd negeration）"))
                .previewDisplayName("iPhone SE（3rd negeration）")
        }
    }
}
