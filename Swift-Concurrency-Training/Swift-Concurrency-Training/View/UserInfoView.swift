//
//  UserInfoView.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2023/01/04.
//

import SwiftUI

struct UserInfoView: View {
    let user: User

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("ID：\(String(user.id.rawValue))")
            Text("名前：\(user.name)")
            Text("誕生日：\(user.birthDay)")
        }
        .padding(10)
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(user: User.userMock())
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
