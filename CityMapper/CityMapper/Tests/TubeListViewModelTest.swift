//
//  TubeListViewModelTest.swift
//  CityMapperTests
//
//  Created by Debasish Chowdhury on 26/01/22.
//

import XCTest
@testable import CityMapper

class TubeListViewModelTest: XCTestCase {

   
    func testSuccess() throws {
        let mockEnvironment = MockEnvironment()
        mockEnvironment.success = true
        let viewModel = TubeListViewModel(environment: mockEnvironment)
        viewModel.getTubeDetailsData(for: "AHSFH")
        XCTAssertNotNil(viewModel.tubeDetails)
    }
    
    func testFailure() throws {
        let mockEnvironment = MockEnvironment()
        mockEnvironment.success = false
        let viewModel = TubeListViewModel(environment: mockEnvironment)
        viewModel.getTubeDetailsData(for: "AHSFH")
        XCTAssert(viewModel.tubeDetails.count == 0)
    }

}
