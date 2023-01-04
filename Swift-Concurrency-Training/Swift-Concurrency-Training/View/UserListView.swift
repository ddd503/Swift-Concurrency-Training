//
//  UserListView.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/09/09.
//

import SwiftUI

struct UserListView: View {
    @StateObject var viewModel = UserListViewModel()
    
    var body: some View {
        NavigationView {
            switch viewModel.viewState {
            case .loading:
                LoadingView {
                    viewModel.cancel()
                }
            case .completed:
                List(viewModel.userList) { user in
                    UserInfoView(user: user)
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
            UserListView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
                .previewDisplayName("iPhone 13")
            UserListView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE（3rd negeration）"))
                .previewDisplayName("iPhone SE（3rd negeration）")
        }
    }
}
