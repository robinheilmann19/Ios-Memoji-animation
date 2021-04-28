//ContentView.swift

import SwiftUI

struct ContentView: View {
    
    
    @State var selected: Bool = false
    @State var cardOffset: CGSize = .zero
    
    var body: some View {
        
        VStack {
            
            Text("hello world")
                .fontWeight(.semibold)
                .foregroundColor(Color.black)
                .font(.system(size: 50))
                .padding(.top, 55 )
            
            Image ("robin")
            .frame(width: 700, height: selected ? 700 : 900)
            .cornerRadius(selected ? 45 : 17)
            .shadow(radius: 85)
            .onTapGesture {
                selected.toggle()
            }
            .scaleEffect(selected ? 1.0 : 0.5)
            .rotationEffect( selected ? Angle (degrees: 12) : .zero)
            .offset(cardOffset)
                .animation(.interpolatingSpring(mass: 1.0,
                                            stiffness: 500,
                                            damping: 8,
                                            initialVelocity: 0))
            .gesture(
              DragGesture()
                .onChanged({
                    changedValue in
                    cardOffset = changedValue .translation
                })
                .onEnded({
                    _ in
                    cardOffset = .zero
                })
                )
          
        }.background(Color(.orange))
        .ignoresSafeArea()
        
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
  
    }




