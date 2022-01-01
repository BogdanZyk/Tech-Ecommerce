//
//  Profile.swift
//  Tech Ecommerce
//
//  Created by Богдан Зыков on 30.12.2021.
//

import SwiftUI

struct Profile: View {
    @AppStorage("log_status") var log_status: Bool = false
    var body: some View {
        Button{
            log_status.toggle()
        } label: {
            Text("Log out")
                .font(.custom(customFont, size: 30).bold())
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
