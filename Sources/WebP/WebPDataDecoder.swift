//
//  WebPDataDecoder.swift
//  NukeWebP
//
//  Created by nagisa-kosuge on 2018/01/12.
//

import Foundation

public struct WebPDataDecoder: DataDecoding {

    public func decode(data: Data, response: URLResponse) -> Image? {
        return WebPDecoder.decodeWebPData(data)
    }

}
