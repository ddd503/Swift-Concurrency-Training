//
//  UserListView.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/09/09.
//

import SwiftUI

struct UserListView: View {
    @StateObject var viewModel = UserListViewModel()
    // structの中で状態を変更するものを定義する時は@State
    @State var task: Task<Void, Never>?

    var body: some View {
        NavigationView {
            switch viewModel.viewState {
            case .loading:
                LoadingView {
                    task?.cancel()
                    viewModel.cancel()
                }
            case .completed:
                List(viewModel.userList) { user in
                    UserInfoView(user: user)
                }
                .navigationTitle("User List")
                .refreshable {
                    task = Task {
                        await viewModel.fetchUser()
                    }
                }
            case .failed:
                ErrorReloadView(reloadAction: {
                    task = Task {
                        await viewModel.fetchUser()
                    }
                }, errorMessage: "読み込み中に問題が発生しました。\n再度読み込みを行なってください。")
            }
        }
        .onAppear {
            task = Task {
                await viewModel.fetchUser()
            }
        }
    }
}

struct DataListView_Previews: PreviewProvider {
    static var previews: some View {
        Group { // 複数端末でpreview見る
            UserListView()
                .preferredColorScheme(.light)
                .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
                .previewDisplayName("iPhone 13")
            UserListView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE（3rd negeration）"))
                .previewDisplayName("iPhone SE（3rd negeration）")
        }
    }
}
