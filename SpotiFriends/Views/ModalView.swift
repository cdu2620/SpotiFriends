//
//  ModalView.swift
//  SpotiFriends
//
//  Created by Aiyana Huang on 11/23/21.
//

import SwiftUI

struct ModalView: View {
   @Binding var isShowing: Bool
  
    var body: some View {
      ZStack(alignment: .bottom) {
        if isShowing {
          Color.green
              .opacity(0.3)
              .ignoresSafeArea()
              .onTapGesture {
                isShowing = false
            }
            VStack {
              Text("You Matched!")
              Button("Dismiss") {
                self.isShowing.toggle()
              }
            } // end of vStack
              .frame(height: 800)
              .frame(maxWidth: .infinity)
              .background(Color.green)
              .transition(.move(edge: .bottom))
          }
        }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
      .ignoresSafeArea()
      .animation(.easeInOut)
    }
    
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
      ModalView(isShowing: .constant(true))
    }
}
