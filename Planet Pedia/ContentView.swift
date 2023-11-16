//
//  ContentView.swift
//  Planet Pedia
//
//  Created by Richard Nkanga on 15/11/2023.
//

import SwiftUI

struct PlanetPage: Identifiable {
    let id = UUID()
    let name: String
    let position: String
    let distance: Int
    let imageName: String
    let description: String
}

struct ContentView: View {
    let page: [PlanetPage] = [
        PlanetPage(name: "Sun", position: "The Sun", distance: 57_900_000, imageName: "sun", description: "The Sun is the star at the center of our solar system. It is a nearly perfect sphere of hot plasma, with internal convective motion generating a magnetic field."),
        PlanetPage(name: "Mercury", position: "1st Planet", distance: 57_900_000, imageName: "mercury", description: "Mercury is the smallest and closest planet to the Sun. It has a thin atmosphere, and its surface is covered in craters and volcanic plains."),
        PlanetPage(name: "Venus", position: "2nd Planet", distance: 108_200_000, imageName: "venus", description: "Venus is known for its thick, toxic atmosphere, which traps heat and makes it the hottest planet in our solar system. Its surface features highland regions and vast plains."),
        PlanetPage(name: "Earth", position: "3rd Planet", distance: 149_600_000, imageName: "earth", description: "Earth is the only known planet with life. It has a diverse climate, oceans, and a variety of ecosystems. The presence of water is a key factor for life."),
        PlanetPage(name: "Mars", position: "4th Planet", distance: 227_900_000, imageName: "mars", description: "Mars is often called the Red Planet due to its iron-rich soil. It has the tallest volcano and the deepest canyon in our solar system. Scientists search for signs of past life on Mars."),
        PlanetPage(name: "Jupiter", position: "5th Planet", distance: 778_600_000, imageName: "jupiter", description: "Jupiter is the largest planet in our solar system. It has a strong magnetic field, and its iconic Great Red Spot is a giant storm. Jupiter has a ring system, though not as prominent as Saturn's."),
        PlanetPage(name: "Saturn", position: "6th Planet", distance: 1_433_500_000, imageName: "saturn", description: "Saturn is famous for its stunning ring system, composed of icy particles and debris. It has a hexagonal-shaped storm at its north pole. Saturn is a gas giant with a rocky core."),
        PlanetPage(name: "Uranus", position: "7th Planet", distance: 2_872_500_000, imageName: "uranus", description: "Uranus is a gas giant with a unique tilt, rotating on its side. It has a blue-green hue due to the presence of methane in its atmosphere. Uranus has a system of faint rings."),
        PlanetPage(name: "Neptune", position: "8th planet", distance: 4_495_100_000, imageName: "neptune", description: "Neptune is the farthest planet from the Sun. It has a deep blue color, and its atmosphere contains storms and high-speed winds. Neptune has a faint ring system and a set of active dark spots."),
    ]
    
    let planets = ["Sun", "Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]
    @State var currentPlanet: String = "Sun"
    @State private var displayedPlanet: String = "Select A Planet"
    @State private var currentIndex = 0
    @State var drag = CGSize.zero
    @State private var dragModeOn = false
    @State private var degrees = 0.0
    @State private var degree2 = 0.0
    
    
    @Namespace var planetTitleAnimation
    
    var body: some View {
        ZStack {
            //            Color(red: 0.31, green: 0.47, blue: 0.31)
            
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .opacity(8.0)
            
            VStack {
                Spacer()
                    .frame(width: 400, height: 20)
                
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(planets.indices, id: \.self) { index in
                                Text("\(planets[index])")
                                    .font(.custom(currentPlanet == "\(planets[index])" ? "Poppins-SemiBold" : "Poppins-Medium", size: currentPlanet == "\(planets[index])" ? 29.75 : 20))
                                    .foregroundColor(currentPlanet == "\(planets[index])" ? .white : Color(red: 1, green: 1, blue: 1).opacity(0.39))
                                    .frame(height: currentPlanet == "\(planets[index])" ? 45 : 30)
                                    .padding(.horizontal, 30)
                                    .onTapGesture {
                                        withAnimation(.easeOut) {
                                            currentPlanet = planets[index]
                                            
                                            
                                            
                                            
                                            
                                            
                                        }
                                    }
                                    .id(planets[index])
                                    .onChange(of: currentPlanet){ op in
                                        
                                        withAnimation(.easeInOut) {
                                            proxy.scrollTo(op, anchor: .center)
                                            
                                            
                                            
                                            
                                        }
                                        
                                    }
                                    .onChange(of: currentIndex) { newValue in
                                        // Update displayedPlanet based on the scroll position or newValue
                                        withAnimation(.easeInOut) {
                                            proxy.scrollTo(newValue, anchor: .center)
                                            
                                            
                                            //                                            displayedPlanet = planets[currentIndex]
                                            //                                            currentPlanet = planets[currentIndex]
                                            
                                            displayedPlanet = "WOrks"
                                            
                                        }
                                    }
                            }
                        }
                    }
                    
                    .coordinateSpace(name: "horizontalScroll")
                }
                
                
                
                ZStack {
                    
                    TabView(selection: $currentIndex) {
                        
                        
                        
                        
                        
                        ForEach(0 ..< page.count) { p in
                            VStack {
                                
                                Text("\(page[p].position)")
                                    .font(.custom("Poppins-SemiBold", size: 29.75))
                                    .foregroundColor(.white)
                                if page[p].position != "The Sun"{
                                    Text("from the sun")
                                        .font(.custom("Poppins-Light", size: 15))
                                        .foregroundColor(.white)
                                    
                                    Text("\(page[p].distance) km")
                                        .foregroundColor(.white)
                                    
                                }
                                
                                Spacer()
                                
                                
                                
                                
                                if page[p].imageName == "sun"{
                                    
                                    Image(page[p].imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 230,height: 230)
                                        .offset(y:80)
                                        .rotation3DEffect(.degrees(rotationAngle()), axis: (x: 0, y: 1, z: 0))
                                    //                                        .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0))
                                    //                                        .offset(drag)
                                    //                                        .rotationEffect(Angle(degrees: rotationAngle()))
                                        .rotationEffect(Angle(degrees: degrees))
                                        .gesture(
                                            DragGesture()
                                                .onChanged { value in
                                                    self.drag = value.translation
                                                    
                                                }
                                                .onEnded { _ in
                                                    withAnimation {
                                                        self.drag = .zero
                                                    }
                                                }
                                        )
                                    
                                    
                                    
                                }else{
                                    
                                    Image(page[p].imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 150,height: 150)
                                        .offset(y:50)
                                        .offset(drag)
                                    //                                                   .rotationEffect(rotationAngle())
                                        .gesture(
                                            DragGesture()
                                                .onChanged { value in
                                                    withAnimation {
                                                        self.drag = value.translation
                                                    }
                                                }
                                                .onEnded { _ in
                                                    withAnimation {
                                                        self.drag = .zero
                                                    }
                                                }
                                        )
                                    
                                    
                                    
                                }
                                
                                
                                
                                Spacer()
                                
                                
                                VStack(alignment: .leading){
                                    
                                    Text(page[p].name)
                                        .padding()
                                        .font(.custom(currentIndex == p ? "Poppins-SemiBold" : "Poppins-Medium", size: currentIndex == p ? 29.75 : 20))
                                        .foregroundColor(.white)
                                    
                                    //                                        .padding(.horizontal, 30)
                                    
                                    
                                    
                                    Text(page[p].description)
                                        .multilineTextAlignment(.leading)
                                        .padding()
                                        .foregroundColor(.white)
                                    
                                }
                                .padding(.horizontal,35)
                                .frame(width: 430, height: 399)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color(red: 0, green: 0, blue: 0).opacity(0), Color(red: 0.06, green: 0.06, blue: 0.06)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
                                )
                                
                                
                                
                                
                            }
                            .tag(p)
                            .padding()
                            .frame(height: 700)
                            .cornerRadius(15)
                            .padding(.horizontal)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .onChange(of: currentIndex) { newValue in
                        
                        displayedPlanet = planets[currentIndex]
                        currentPlanet = planets[currentIndex]
                        //                        proxy.scrollTo(newValue, anchor: .center)
                        
                    }
                    //                    .frame(height: 100)
                    
                    
                    
                    
                    
                    HStack {
                        
                        Button(action: {
                            //                        if currentIndex > 0 {
                            //                            currentIndex -= 1
                            //                        }
                            
                            if currentIndex > 0 {
                                currentIndex -= 1
                                displayedPlanet = planets[currentIndex]
                                currentPlanet = planets[currentIndex]
                            }
                            
                        }, label: {
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 37, alignment: .center)
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            //                        if currentIndex < page.count - 1 {
                            //                            currentIndex += 1
                            //                        }
                            
                            if currentIndex < planets.count - 1 {
                                currentIndex += 1
                                displayedPlanet = planets[currentIndex]
                                currentPlanet = planets[currentIndex]
                            }
                            
                        }, label: {
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 37, alignment: .center)
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .rotationEffect(.degrees(180))
                        })
                    }
                    .padding(.horizontal, 50)
                    .offset(y:-120)
                    

                }


                
                .padding(.bottom,-120)
            }
        }
    }
    
    private func rotationAngle() -> Double {
        let rotationFactor: CGFloat = -10.05
        let angle = -atan2(drag.width, drag.height)
        //          return Angle(radians: Double(angle * rotationFactor))
        return Double(angle * rotationFactor)
    }
}

#Preview {
    ContentView()
}
