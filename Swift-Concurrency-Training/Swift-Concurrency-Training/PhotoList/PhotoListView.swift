//
//  PhotoListView.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/04/11.
//

import SwiftUI
import ComposableArchitecture

struct PhotoListView: View {
    let store: Store<PhotoListState, PhotoListAction>
    @ObservedObject var viewStore: ViewStore<PhotoListState, PhotoListAction>

    init(store: Store<PhotoListState, PhotoListAction>) {
        self.store = store
        self.viewStore = ViewStore(self.store)
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PhotoListView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoListView(store: .init(initialState: PhotoListState(),
                                   reducer: PhotoListView.reducer(),
                                   environment: AppEnvironment()))
    }
}
