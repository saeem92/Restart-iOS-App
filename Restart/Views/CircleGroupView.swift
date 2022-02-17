//
//  CircleGroupView.swift
//  Restart
//
//  Created by saeem  on 17/02/22.
//

import SwiftUI

struct CircleGroupView: View {
    //MARK: -PROPERTY
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    // State property wrapper type that can read and write a value managed by swiftUI.
    var body: some View {
        ZStack{
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }// Zstack
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
