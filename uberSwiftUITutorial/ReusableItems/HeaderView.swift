//
//  HeaderView.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 28/5/23.
//

import SwiftUI

struct HeaderView: View {
    let user:User
    var body: some View {
        HStack {
            Image("male-profile-photo")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 64,height: 64)
            VStack(alignment: .leading,spacing:8) {
                Text(user.fullname)
                    .font(.system(size: 16,weight:.semibold))
                Text(user.email)
                    .font(.system(size: 14))
                    .accentColor(Color.theme.primaryTextColor)
                    .opacity(0.77)
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(user: User(fullname: "John doe", email: "johndoe@gmail.com", uid: "1331311313"))
    }
}
