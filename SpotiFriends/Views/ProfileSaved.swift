//
//  ProfileSaved.swift
//  SpotiFriends
//
//  Created by Joanna Miao on 12/2/21.
//

import SwiftUI

struct ProfileSaved: View {
    @Binding var isShowing: Bool
    
     var body: some View {
       ZStack(alignment: .bottom) {
        let _ = print("Im in profile saved")
        let _ = print(isShowing)
         if isShowing {
             Color.green
               .ignoresSafeArea()
               .onTapGesture {
                 isShowing = false
               }
             VStack {
                 Text("You changes are saved!")
                     .foregroundColor(.white)
                     .zIndex(1)
//                   Button("Dismiss") {
//                     self.isShowing.toggle()
//                   }
             } // end of vStack

           }
         }

     }
     
 }
