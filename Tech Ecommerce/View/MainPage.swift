//
//  MainPage.swift
//  Tech Ecommerce
//
//  Created by Богдан Зыков on 30.12.2021.
//

import SwiftUI

struct MainPage: View {
    @State var currentTab: Tab = .Home
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        VStack(spacing: 0){
            
            TabView(selection: $currentTab){
                Home()
                    .tag(Tab.Home)
                Text("Liked")
                    .tag(Tab.Liked)
                Profile()
                    .tag(Tab.Profile)
                Text("Cart")
                    .tag(Tab.Cart)
            }
            HStack(spacing: 0){
                ForEach(Tab.allCases, id: \.self){ tab in
                    Button {
                        currentTab = tab
                    }label: {
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)

                            .background(
                                Color("Purple")
                                    .opacity(0.1)
                                    .cornerRadius(10)
                                    .blur(radius: 5)
                                    .padding(-7)
                                    .opacity(currentTab == tab ? 1 : 0)
                                
                            )
                            
                            .frame(width: 22, height: 22)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color("Purple") : Color.black.opacity(0.3))
                            
                            
                    }
                }
                .padding([.horizontal, .bottom])
                .padding(.bottom, 10)
                .background(Color("HomeBG").ignoresSafeArea())
            }
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

enum Tab: String, CaseIterable {
    case Home = "Home"
    case Liked = "Liked"
    case Profile = "Profile"
    case Cart = "Cart"
    
    
}
