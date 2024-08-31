//
//  WeatherButton.swift
//  weather app
//
//  Created by Arnav Adarsh on 31/08/24.
//

import SwiftUI
struct WeatherButton: View {
    var text:String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(text).frame(width: 280,height: 50).background(backgroundColor.gradient).foregroundColor(textColor).font(.system(size:20, weight:.bold,design:.default)).cornerRadius(10)
    }
}
