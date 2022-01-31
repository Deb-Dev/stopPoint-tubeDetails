//
//  TubeListView.swift
//  CityMapper
//
//  Created by Debasish Chowdhury on 13/01/22.
//


import SwiftUI

struct TubeListView: View {
    
    @ObservedObject var viewModel: TubeListViewModel
    typealias Environment = FetchTubeDetailsServiceFactory
    
    private let environment: Environment
    private let stopPointId: String


    init(environment: Environment, stopPointId: String) {
        self.environment = environment
        self.stopPointId = stopPointId
        viewModel = TubeListViewModel(environment: environment)

        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hexStringToUIColor(hex: "#29272P"))
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.tubeDetails, id: \.self) {
                            value in
                            TubeDetailsCardView(tubeDetail: value)
                            NavigationLink(destination: TubeDetailsCardView(tubeDetail: value)){
                                TubeDetailsCardView(tubeDetail: value)
                            }
                        }.foregroundColor(.black)
                    }
                }
                .navigationTitle("Tubes").foregroundColor(.black)
            }
            
        }
        .onAppear {
            UITableView.appearance().separatorStyle = .none
            UITableView.appearance().showsVerticalScrollIndicator = false
            viewModel.getTubeDetailsData(for: stopPointId)
        }
    }

}



struct TubeListView_Previews: PreviewProvider {
    static var previews: some View {
        TubeListView(environment: CityMapperEnvironment(),stopPointId: "")
    }
}
