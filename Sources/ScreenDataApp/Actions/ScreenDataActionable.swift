//
//  ScreenDataActionable.swift
//  
//
//  Created by Leif on 3/29/22.
//

public protocol ScreenDataActionable {
    var id: String { get }
    func fire()
}
