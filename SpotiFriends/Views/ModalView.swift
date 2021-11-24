//
//  ModalView.swift
//  SpotiFriends
//
//  Created by Aiyana Huang on 11/23/21.
//

import SwiftUI

struct ModalView: View {
   @Binding car isShowing: Bool
  
    var body: some View {
      ZStack(alighment: .bottom) {
        if isShowing {
          Color.green
              .opacity(0.3)
              .ignoreSafeArea()
              .onTapGesture {
                isShowing = false
            }
            VStack {
              Text("You Matched!")
            } // end of vStack
              .frame(height: 400)
              .frame(maxWidth: .infinity)
              .background(Color.white)
              .transition(.move(edge: .bottom))
          }
        }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alighment: .bottom)
      .ignoreSafeArea()
      .animation(.easeInOut)
    }
    
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
      ModalView(isShowing: .constant(true))
    }
}
