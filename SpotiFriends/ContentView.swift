//
//  ContentView.swift
//  SpotiFriends
//
//  Created by Catherine D on 10/12/21.
//

import SwiftUI
import Firebase
import FirebaseDatabase

struct ContentView: View {

    @ObservedObject var vm = ViewModel()
    var body: some View {
        Text("hello")
        List(vm.list)  { item in
            Text(item.f_name)
            
        }
    }
    init() {
            vm.getData()
    }

}
