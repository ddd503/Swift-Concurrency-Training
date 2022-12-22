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
        ScrollView {
            LazyVStack(alignment: .leading) {
                
            }
            .padding(20)
        }
    }
}

struct DataListView_Previews: PreviewProvider {
    static var previews: some View {
        DataListView()
    }
}
