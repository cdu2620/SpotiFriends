//
//  ContentView.swift
//  SpotiFriends
//
//  Created by Catherine D on 10/12/21.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @ObservedObject var model = ViewModel()
    var body: some View {
        List(model.list) { item in
            Text(item.f_name)
            
        }
    }
    init() {
        model.getData()
    }
}
