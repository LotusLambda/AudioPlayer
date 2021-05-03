//
//  ContentView.swift
//  AudioPlayer
//
//  Created by Aron Balog on 03.05.2021..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(selection: .constant(0),
                content:  {
                    Text("Tab Content 1").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/ }.tag(1)
                    
                    Text("Tab Content 2").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(2)
                })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
