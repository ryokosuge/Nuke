// The MIT License (MIT)
//
// Copyright (c) 2017 Alexander Grebenyuk (github.com/kean).

import Foundation
import NukeWebP

class MockFailingDecoder: NukeWebP.DataDecoding {
    var isFailing = false

    func decode(data: Data, response: URLResponse) -> Image? {
        return nil
    }
}
