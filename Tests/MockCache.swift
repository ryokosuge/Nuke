// The MIT License (MIT)
//
// Copyright (c) 2017 Alexander Grebenyuk (github.com/kean).

import Foundation
import NukeWebP

class MockCache: Caching {
    let queue = DispatchQueue(label: "com.github.ryokosuge.NukeWebP.MockCache")
    var enabled = true
    var images = [AnyHashable: Image]()
    
    init() {}

    subscript(key: AnyHashable) -> Image? {
        get {
            return queue.sync {
                enabled ? images[key] : nil
            }
        }
        set {
            queue.sync {
                if enabled { images[key] = newValue }
            }
        }
    }
}
