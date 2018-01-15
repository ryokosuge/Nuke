//
//  WebPDataDecoder.swift
//  NukeWebP
//
//  Created by ryokosuge on 2018/01/12.
//  Copyright © 2018年 RyoKosuge. All rights reserved.
//

import Foundation

public struct WebPDataDecoder: DataDecoding {

    public init() { }

    public func decode(data: Data, response: URLResponse) -> Image? {
        return WebPDecoder.decodeWebPData(data)
    }

}
