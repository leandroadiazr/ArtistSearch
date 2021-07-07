//
//  ArtistSearchTests.swift
//  ArtistSearchTests
//
//  Created by Leandro Diaz on 7/6/21.
//

import XCTest
@testable import ArtistSearch

class ArtistSearchTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    class MockURLSession: URLSession {
      var cachedUrl: URL?
        override func dataTask(with url: URL, completionHandler completed: @escaping(Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.cachedUrl = url
            return URLSession.shared.dataTask(with: url)
      }
    }
    
    
    func testGetArtistSongsWithExpectedURL() throws {
        let networkManager = NetworkManager()
        let mockURLSession  = URL(string: "itunes.search.com")
        
        networkManager.getArtist(for: "bruno") { artist in
            XCTAssertEqual(mockURLSession?.absoluteString, "itunes.search.com")
            XCTAssertEqual(mockURLSession?.path, "/bruno")
        }
    }


}
