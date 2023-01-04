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
            case .loading:
                ProgressView()
            case .completed:
                List(viewModel.dataList) { data in
                    Text(data.name)
                }
                .navigationTitle("User List")
                .refreshable {
                    viewModel.pullToRefresh()
                }
            case .failed:
                ErrorReloadView(reloadAction: {
                    viewModel.onTapReloadButton()
                }, errorMessage: "読み込み中に問題が発生しました。\n再度読み込みを行なってください。")
            }
        }
        .onAppear {
            viewModel.onAppear()
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
