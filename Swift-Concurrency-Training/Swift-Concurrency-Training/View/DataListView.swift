//
//  DataListView.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/09/09.
//

import SwiftUI
import Combine

struct DataListView: View {
    @StateObject var viewModel = DataListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.dataList) { data in
                Text(data.name)
            }.onAppear {
                viewModel.onAppear()
            }
            .navigationTitle("User List")
        }
    }
}

struct DataListView_Previews: PreviewProvider {
    static var previews: some View {
        DataListView()
    }
}
