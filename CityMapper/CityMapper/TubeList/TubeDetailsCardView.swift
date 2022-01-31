//
//  TubeDetailsCardView.swift
//  CityMapper
//
//  Created by Debasish Chowdhury on 13/01/22.
//

import Foundation
import SwiftUI

struct TubeDetailsCardView: View {
    
    let tubeDetail: TubeDetail
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(LinearGradient(gradient: Gradient(colors: [Color(hexStringToUIColor(hex: "#B4D2C0"))]), startPoint: .top, endPoint: .bottom))
            VStack {
                HStack {
                        Image(systemName: "cablecar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20, alignment: .center)
                            .foregroundColor(.black)
                        Text(tubeDetail.currentLocation ?? "")
                        Spacer()
                    Text(tubeDetail.stationName ?? "")

                    
                }
                VStack{
                    Text(tubeDetail.direction ?? "")
                        .font(.title)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    Text(tubeDetail.lineName ?? "")
                        .font(.title)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                
                HStack {
                    Image(systemName: "grid.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20, alignment: .center)
                        .foregroundColor(.black)
                    
                    Text(tubeDetail.platformName ?? "")
                        .font(.title2)
                        .fontWeight(.medium)
                    Spacer()
                    VStack{
                        Text("Currently at:")
                        Text(tubeDetail.currentLocation ?? "")
                    }
                    
                }
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .frame(height: 1)

                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .frame(height: 1)
                
            }
            .padding()
        }
        .frame(maxWidth: 350, minHeight: 0,maxHeight: 900, alignment: .center)
    }
}

