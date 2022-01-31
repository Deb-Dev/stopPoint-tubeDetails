//
//  StopPointCardView.swift
//  CityMapper
//
//  Created by Debasish Chowdhury on 23/12/21.
//

import Foundation
import SwiftUI

struct StopPointCardView: View {
    
    let stopPoint: StopPoint
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(LinearGradient(gradient: Gradient(colors: [Color(hexStringToUIColor(hex: "#B4D2C8"))]), startPoint: .top, endPoint: .bottom))
            VStack {
                HStack {
                        Image(systemName: "train.side.front.car")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20, alignment: .center)
                            .foregroundColor(.black)
                        Text(stopPoint.stopType ?? "")
                        Spacer()
                        Text(stopPoint.hubNaptanCode ?? "")

                    
                }
                Text(stopPoint.commonName ?? "")
                    .font(.title)
                    .fixedSize(horizontal: false, vertical: true)
                
                HStack {
                    Image(systemName: "grid.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20, alignment: .center)
                        .foregroundColor(.black)
                    
                    Text("\(stopPoint.id)")
                        .font(.title2)
                        .fontWeight(.medium)
                    Spacer()
                    VStack{
                        Text("Distance : ")
                        Text("\(stopPoint.distance ?? 0.0)")
                    }
                    
                }
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .frame(height: 1)
                if let facilities = stopPoint.getFacilities() {
                    TagCloudView(tags: facilities)
                }

                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .frame(height: 1)
                
            }
            .padding()
        }
        .frame(maxWidth: 350, minHeight: 0,maxHeight: 900, alignment: .center)
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}


struct TagCloudView: View {
    var tags: [String]

    @State private var totalHeight
          = CGFloat.zero

    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.tags, id: \.self) { tag in
                self.item(for: tag)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == self.tags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == self.tags.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func item(for text: String) -> some View {
        Text(text)
            .padding(.all, 5)
            .font(.body)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(5)
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}
