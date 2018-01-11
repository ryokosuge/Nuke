// The MIT License (MIT)
//
// Copyright (c) 2017 Alexander Grebenyuk (github.com/kean).

import NukeWebP
import XCTest

let defaultURL = URL(string: "http://test.com")!

let defaultImage: Image = {
    let bundle = Bundle(for: MockImageLoader.self)
    let URL = bundle.url(forResource: "Image", withExtension: "jpg")
    let data = try! Data(contentsOf: URL!)
    return NukeWebP.DataDecoder().decode(data: data, response: URLResponse())!
}()

extension String: Error {}


