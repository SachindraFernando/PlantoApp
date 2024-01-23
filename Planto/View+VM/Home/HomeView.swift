//
//  HomeView.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-11.
//

import SwiftUI

struct HomeView: View {
    
    @State  var isActiveMyCartScreen: Bool = false
    @State  var isClickedOne: Bool = true
    @State  var isClickedTwo: Bool = false
    @State  var isClickedThree: Bool = false
    @State  var isClickedFour: Bool = false
    @State  var isClickedFive: Bool = false
    @State  var isClickedSix: Bool = false
    @State  var isClickedSeven: Bool = false
    @State private var activeIndex = 1
    @State  var isActivePlantScreen: Bool = false
    @State var  selectedPlant:PlantModel = dummyPlantModel
    @State var menuxAxis = -UIScreen.main.bounds.width + 90
    @State  var isActiveSeeAll: Bool = false
    private var numberOfImages = 5

    var body: some View {
        
        ZStack {
           Theme.defaultBackgroundColor
            
            VStack{
                
                //header
                HomeHeaderTwo(title: "Plants App", leadingIcon: "ic_menu", trailingIcon: "ic_cart", actionLeading: {
                    withAnimation {
                        menuxAxis = 0
                    }
                }, actionTrailing: {
                    isActiveMyCartScreen.toggle()
                })

                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        VStack(alignment: .center, spacing: 15) {
                            
                            SearchBar(image:"ic_search",hint: "Search cactus, flowers...", text: .constant(""))
                                .padding(.top,20)
                            
                            ZStack{
                                VStack{
                                    TabView{
                                        ForEach(0..<numberOfImages){ num in
                                            
                                            Image("\(num)")
                                                .resizable()
                                                .scaledToFill()
                                                .overlay(Color.black.opacity(0.2))
                                                .tag(num)
                                        }
                                    }.tabViewStyle(PageTabViewStyle())
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                        //.padding()
                                        .frame(width: geometry.size.width/1.1, height: geometry.size.height/4)
                                        
                                }
                                
                                //Image("banner_one")
                                    //.cornerRadius(10)
                                HStack{
                                    VStack{
                                        Text("Online Plant Shop")
                                            .font(.customFont(.InterSemiBold, 10))
                                        Button("Buy Now") {
                                            isActivePlantScreen.toggle()
                                        }
                                        .font(.customFont(.InterSemiBold, 10))
                                        .modifier(PrimaryBtnStyle(maxWidth: 70, minHeight: 10,maxHeight: 25, cornerRadius: 12))
                                        .padding(.top,10)
                                    }.padding()
                                    Spacer()
                                }
                            }
                            
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing:23) {
                                    
                                    CategoryCard(title: "All", index: 1, isClicked: isClickedOne,textColor: Theme.primaryColor, bgColor: Theme.borderColor){
                                        isClickedOne = true
                                        isClickedTwo = false
                                        isClickedThree = false
                                        isClickedFour = false
                                        isClickedFive = false
                                        isClickedSix = false
                                        isClickedSeven = false
                                    }
                                    
                                    CategoryCard(title: "Recommended", index: 2, isClicked: isClickedTwo, textColor: Theme.primaryColor, bgColor: Theme.borderColor){
                                        isClickedOne = false
                                        isClickedTwo = true
                                        isClickedThree = false
                                        isClickedFour = false
                                        isClickedFive = false
                                        isClickedSix = false
                                        isClickedSeven = false
                                        
                                    }
                                    
                                    CategoryCard(title: "Trees", index: 3, isClicked: isClickedThree,textColor: Theme.primaryColor, bgColor: Theme.borderColor){
                                        isClickedOne = false
                                        isClickedTwo = false
                                        isClickedThree = true
                                        isClickedFour = false
                                        isClickedFive = false
                                        isClickedSix = false
                                        isClickedSeven = false
                                        
                                    }
                                    
                                    CategoryCard(title: "Flowers", index: 4,isClicked: isClickedFour, textColor: Theme.primaryColor, bgColor: Theme.borderColor){
                                        isClickedOne = false
                                        isClickedTwo = false
                                        isClickedThree = false
                                        isClickedFour = true
                                        isClickedFive = false
                                        isClickedSix = false
                                        isClickedSeven = false
                                        
                                    }
                                    
                                    CategoryCard(title: "Indoor", index: 5, isClicked: isClickedFive,textColor: Theme.primaryColor, bgColor: Theme.borderColor){
                                        isClickedOne = false
                                        isClickedTwo = false
                                        isClickedThree = false
                                        isClickedFour = false
                                        isClickedFive = true
                                        isClickedSix = false
                                        isClickedSeven = false
                                        
                                    }
                                    
                                    CategoryCard(title: "Outdoor", index: 6,isClicked: isClickedSix, textColor: Theme.primaryColor, bgColor: Theme.borderColor){
                                        isClickedOne = false
                                        isClickedTwo = false
                                        isClickedThree = false
                                        isClickedFour = false
                                        isClickedFive = false
                                        isClickedSix = true
                                        isClickedSeven = false
                                        
                                    }
                                    
                                    CategoryCard(title: "Garden", index: 7,isClicked: isClickedSeven, textColor: Theme.primaryColor, bgColor: Theme.borderColor){
                                        isClickedOne = false
                                        isClickedTwo = false
                                        isClickedThree = false
                                        isClickedFour = false
                                        isClickedFive = false
                                        isClickedSix = false
                                        isClickedSeven = true
                                        
                                    }
                                    
                                }//:HStack
                            }//:ScrollView
                            
                            HStack {
                                Text("Best Plant")
                                    .font(.customFont(.InterSemiBold, 16))
                                Spacer()
                                
                                Text("See all")
                                    .font(.customFont(.InterRegular, 12))
                                    .foregroundColor(Theme.primaryColor)
                            }//:HStack
                            ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 8) {
                                            ForEach(dummyPlantList) { plantModel in
                                                
                                                BestPlantCard(plantModel: plantModel)
                                                    
                                            }
                                        }//:HStack
                                    }//:ScrollView
                            
                            HStack {
                                Text("Popular Plant")
                                    .font(.customFont(.InterSemiBold, 16))
                                Spacer()
                                
                                Button(action: {
                                    isActiveSeeAll.toggle()
                                }, label: {
                                    Text("See all")
                                        .font(.customFont(.InterRegular, 12))
                                        .foregroundColor(Theme.primaryColor)
                                })
                            }//:HStack
                            ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 8) {
                                            ForEach(dummyPlantList.reversed()) { plantModel in
                                                
                                                BestPlantCard(plantModel: plantModel)
                                                    
                                            }
                                        }//:HStack
                                    }//:ScrollView
                           
                            HStack {
                                Text("Recently Added")
                                    .font(.customFont(.InterSemiBold, 16))
                                Spacer()
                                
                                Button(action: {
                                    isActiveSeeAll.toggle()
                                }, label: {
                                    Text("See all")
                                        .font(.customFont(.InterRegular, 12))
                                        .foregroundColor(Theme.primaryColor)
                                })
                            }//:HStack
                            
                            VStack(spacing: 10) {
                                ForEach(dummyPlantListTwo.reversed()) { plantModel in

                                    RecentlyAddedCard(plant: plantModel)
                                }
                            }//:VStack
                            Spacer()
                            
                        }//:VStack
                        .padding(.horizontal,24)
                        .frame(minHeight: geometry.size.height)
                    }//:ScrollView
                    .frame(width: geometry.size.width)
                }//:GeometryReader
            }//:VStack
            SlideMenuView(menuxAxis: $menuxAxis)
           
            
        }//:ZStack
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .navigate(to: MyCartView(),when: $isActiveMyCartScreen)
        .navigate(to: PlantDetailView(plantDetail: selectedPlant),when: $isActivePlantScreen)
        .navigate(to: FavouriteView(),when: $isActiveSeeAll)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

