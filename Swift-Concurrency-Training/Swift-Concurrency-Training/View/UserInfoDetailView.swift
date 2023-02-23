//
//  UserInfoDetailView.swift
//  Swift-Concurrency-Training
//
//  Created by kawaharadai on 2023/02/24.
//

import SwiftUI

struct UserInfoDetailView: View {
    let userInfo: User

    var body: some View {
        VStack(spacing: 10) {
            Text("\(userInfo.id.rawValue)")
            Text(userInfo.name)
            Text(userInfo.birthDay)
        }
    }
}

struct UserInfoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoDetailView(userInfo: User.userMock())
    }
}
