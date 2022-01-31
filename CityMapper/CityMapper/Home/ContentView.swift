//
//  ContentView.swift
//  CityMapper
//
//  Created by Debasish Chowdhury on 22/12/21.
//


import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    typealias Environment = FetchTubePointsServiceFactory & FetchTubeDetailsServiceFactory
    
    private let environment: Environment

    init(environment: Environment) {
        self.environment = environment
        viewModel = HomeViewModel(environment: environment)
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hexStringToUIColor(hex: "#29272E"))
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.stopPoints, id: \.self) { value in
                            NavigationLink(destination: TubeListView(environment: environment, stopPointId: value.id)) {
                                StopPointCardView(stopPoint: value)
                            }
                            .foregroundColor(.black)
                        }
                    }
                }
                .navigationTitle("Stations")
            }
            
        }
        .onAppear {
            UITableView.appearance().separatorStyle = .none
            UITableView.appearance().showsVerticalScrollIndicator = false
            viewModel.getHomeData()
        }
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(environment: CityMapperEnvironment())
    }
}
