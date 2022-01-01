//
//  Search.swift
//  Tech Ecommerce
//
//  Created by Богдан Зыков on 30.12.2021.
//

import SwiftUI

struct Search: View {
    var animation: Namespace.ID
    @FocusState var startTF: Bool
    @EnvironmentObject var homeData: HomeViewModel
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 20){
                Button{
                    withAnimation{
                        homeData.searchActivated = false
                    }
                    homeData.searchText = ""
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(Color.black.opacity(0.7))
                }
                HStack(spacing: 15){
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    TextField("Search", text: $homeData.searchText)
                        .focused($startTF)
                        .textCase(.lowercase)
                        .disableAutocorrection(true)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                    
                Capsule()
                    .strokeBorder(Color("Purple"), lineWidth: 1.5)
                )
               .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                .padding(.trailing,20)
            }
            .padding([.horizontal])
            .padding(.top)
            padding(.bottom,10)

            if let products = homeData.searchedProducts{
                if products.isEmpty{
                    VStack(spacing: 10){
                        Image("NotFound")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.top, 60)
                        Text("Item not found")
                            .font(.custom(customFont, size: 22).bold())
                        Text("Try a more generic search term or try looking for alternative products.")
                            .font(.custom(customFont, size: 16))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30)
                    }
                    .padding()
                }
                else{
                    
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing: 0){
                            
                            Text("Found \(products.count) results")
                                .font(.custom(customFont, size: 24).bold())
                                .padding(.vertical)
                            
                            StaggeredGrid(colums: 2, spacing: 20, list: products){product in
                            productCardView(product: product)
                            }
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                }
            }else{
                ProgressView()
                    .padding(.top, 30)
                    .opacity(homeData.searchText == "" ? 0 : 1)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
        Color("HomeBG")
            .ignoresSafeArea()
        )
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                startTF = true
            }
        }
    }
    
    @ViewBuilder
    func productCardView(product:Product) -> some View{
        VStack(spacing: 10){
            
            Image(product.productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(product.title)
                .font(.custom(customFont, size: 18))
                .fontWeight(.semibold)
                .padding(.top)
            
            Text(product.subtitle)
                .font(.custom(customFont, size: 14))
                .foregroundColor(.gray)
            
            Text(product.price)
                .font(.custom(customFont, size: 18).bold())
                .foregroundColor(Color("Purple"))
                .padding(.top, 5)
        }
        .padding(.horizontal, 20)
        .padding(.bottom,22)
        .background(
            Color.white
                .cornerRadius(25)
        )
        .padding(.top, 50)
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Home()

    }
}
