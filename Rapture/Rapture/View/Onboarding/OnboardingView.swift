//
//  Home.swift
//  Rapture
//
//  Created by Dylan da Silva on 2021/09/29.
//

import SwiftUI

//Home/Feed View
struct OnboardingView: View {
    
    var screenSize: CGSize
    @State var offset: CGFloat = 0
    @AppStorage("currentPageIndex") var currentPageIndex = 1
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack {
                Button {
                    
                } label: {
                    Image("Logo")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 45, height: 45)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 40)
                .padding(.top, 20)
                
                OffsetPageTabView(offset: $offset) {
                    HStack(spacing: 0) {
                        ForEach(items) { item in
                            VStack {
                                Color("Background")
                                Image(item.image)
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: screenSize.height / 2.15)
                                    .background(Color("Background"))
                                
                                VStack(alignment: .leading, spacing: 22) {
                                    Text(item.title)
                                        .font(Font.custom("Gilroy-Bold", size: 28))
                                        .foregroundColor(Color("White"))
                                    
                                    Text(item.description)
                                        .font(Font.custom("Gilroy-Regular", size: 20))
                                        .foregroundColor(Color("White"))
                                        .lineSpacing(5)
                                        .frame(width: .infinity, height: 80, alignment: .leading)
                                }
                                .padding(.top, 50)
                                .padding(.leading, 40)
                                .padding(.trailing, 40)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .background(Color("Background"))
                            //Setting max width
                            .frame(width: screenSize.width)
                        }
                    }
                }
                
                //Animated Indicator
                HStack(alignment: .bottom) {
                    
                    //Page Indicators
                    HStack(spacing: 12) {
                        ForEach(items.indices, id: \.self) { index in
                            Capsule()
                                .fill(Color("Gray"))
                                //Increasing width for only current index
                                .frame(width: getIndex() == index ? 26 : 7, height: 7)
                        }
                    }
                    .overlay(
                        Capsule()
                            .fill(Color("Red"))
                            .frame(width: 25, height: 7)
                            .offset(x: getIndicatorOffset())
                        ,alignment: .leading
                    )
                    .offset(x: 40, y: -25)
                    
                    Spacer()
                    
                    Button {
                        //Updating Offset
                        let index = min(getIndex() + 1, items.count - 1)
                        offset = CGFloat(index) * screenSize.width
                        currentPageIndex += 1
                        
                    } label: {
                        Image(systemName: "chevron.right")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                            .padding(20)
                            .background(Color("Red"))
                            .clipShape(Circle())
                            .shadow(color: Color("Red").opacity(0.6), radius: 15)
                    }
                }
                .padding(.trailing, 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .animation(.easeInOut, value: getIndex())
        }
    }
    
    //Offset for indicators
    func getIndicatorOffset() -> CGFloat {
        let progress = offset / screenSize.width
        let maxWidth: CGFloat = 12 + 7
        
        return progress * maxWidth
    }
    
    func getIndex() -> Int {
        let progress = round(offset / screenSize.width)
        
        //For safety
        let index = min(Int(progress), items.count - 1)
        return index
    }
}

//Home/Feed View Preview
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
