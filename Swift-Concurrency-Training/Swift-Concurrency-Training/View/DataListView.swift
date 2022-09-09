//
//  DataListView.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2022/09/09.
//

import SwiftUI

struct DataListView: View {
    @State var dataList: [String]
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(dataList, id: \.self) { data in
                    Text(data)
                }
            }
            .padding(20)
        }
    }
}

struct DataListView_Previews: PreviewProvider {
    static var previews: some View {
        DataListView(dataList: [
            "テスト1",
            "テスト2",
            "テスト3"])
    }
}
