//
//  ModalView.swift
//  SpotiFriends
//
//  Created by Aiyana Huang on 11/23/21.
//

import SwiftUI

struct ModalView: View {
   @Binding var isShowing: Bool
    var matchedUser : User
    var body: some View {
      ZStack(alignment: .bottom) {
        let _ = print("inside modal view printing isShowing")
        let _ = print(isShowing)
        if isShowing {
            VStack {
                Text("You Matched with"+matchedUser.personal_info.f_name+matchedUser.personal_info.l_name)
                    .foregroundColor(.white)
                    .zIndex(1)
                  Button("Dismiss") {
                    self.isShowing.toggle()
                  }
            } // end of vStack
              .frame(height: 800)
              .frame(maxWidth: .infinity)
              .background(Color.green)
              .transition(.move(edge: .bottom))
//          Color.green
//              .opacity(0.3)
//              .ignoresSafeArea()
//              .onTapGesture {
//                isShowing = false
//              }
            let _ = print("about to enter v stack")
//            VStack {
//                Text("You Matched with"+matchedUser.personal_info.f_name+matchedUser.personal_info.l_name)
//                    .foregroundColor(.white)
//                  Button("Dismiss") {
//                    self.isShowing.toggle()
//                  }
//            } // end of vStack
//              .frame(height: 800)
//              .frame(maxWidth: .infinity)
////              .background(Color.green)
//              .transition(.move(edge: .bottom))
          }
        }
//      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
//      .ignoresSafeArea()
//      .animation(.easeInOut)
    }
    
}

//struct ModalView_Previews: PreviewProvider {
//    static var previews: some View {
//      ModalView(isShowing: .constant(true))
//    }
//}
