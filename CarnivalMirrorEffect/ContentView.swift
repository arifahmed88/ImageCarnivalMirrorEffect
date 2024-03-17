//
//  ContentView.swift
//  CarnivalMirrorEffect
//
//  Created by ArifAhmed on 17/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var speed:CGFloat = 5
    private var startDate:Date = .init()
    private var image = UIImage(named: "test")!
    
    var body: some View {
        VStack {
            List{
                TimelineView(.animation){
                    let time = $0.date.timeIntervalSince1970 - startDate.timeIntervalSince1970
                    
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 500)
                        .frame(maxWidth: .infinity)
                        .distortionEffect(.init(function: .init(library: .default, name: "carnivalMirror"), arguments: [.float(getWavelength(value: Float(time)))]), maxSampleOffset: .zero)
                    
                }
                Section("Strength"){
                    Slider(value: $speed,in: 0...10)
                }
            }
        }
        .padding()
    }
    
    private func getWavelength(value:Float)->Float{
        return abs(sin(value))*Float(speed)
    }
    
}

#Preview {
    ContentView()
}
