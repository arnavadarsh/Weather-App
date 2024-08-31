//
//  ContentView.swift
//  weather app
//
//  Created by Arnav Adarsh on 31/08/24.
//

import SwiftUI
struct ContentView: View {
    @State private var isNight=false
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight)
            VStack{
                CityName(city: "New Delhi, India")
                MainWeatherView(image: isNight ? "moon.stars.fill":"cloud.sun.fill", temperature: 76)
               HStack(spacing: 20){
                    WeatherOfTheDay(day: "TUE", image: "cloud.sun.fill", temperature: 74)
                    WeatherOfTheDay(day: "WED", image: "sun.max.fill", temperature: 88)
                    WeatherOfTheDay(day: "THU", image: "wind.snow", temperature: 55)
                    WeatherOfTheDay(day: "FRI", image: "sunset.fill", temperature: 60)
                    WeatherOfTheDay(day: "SAT", image: "snow", temperature: 25)
                }
                Spacer()
                Button{
                    isNight.toggle()
                }label: {
                    WeatherButton(text: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}
#Preview {
    ContentView()
}
struct WeatherOfTheDay: View {
    var day:String
    var image:String
    var temperature:Int
    var body: some View {
        VStack{
            Text(day).font(.system(size: 24, weight:.medium,design:.default)).foregroundColor(.white)
            Image(systemName: image).renderingMode(.original).resizable().aspectRatio(contentMode: .fit)
                .frame(width:40, height:40)
            Text("\(temperature)°").font(.system(size: 24, weight:.medium,design:.default)).foregroundColor(.white)
        }
    }
}
struct CityName: View {
    var city:String
    var body: some View {
        Text(city).font(.system(size:32, weight: .medium, design:.default)).foregroundColor(.white).padding()
    }
}
struct MainWeatherView: View {
    var image: String
    var temperature:Int
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: image).symbolRenderingMode(.multicolor).resizable().aspectRatio(contentMode: .fit)
                .frame(width:180, height:180)
            Text("\(temperature)°").font(.system(size: 32,weight:.medium,design:.default)).foregroundColor(.white)
        }.padding(.bottom,60)
    }
}
struct BackgroundView: View {
    var isNight:Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black:.blue, isNight ? .gray : .white]), startPoint:.topLeading, endPoint: .bottomTrailing).ignoresSafeArea(.all)
    }
}
