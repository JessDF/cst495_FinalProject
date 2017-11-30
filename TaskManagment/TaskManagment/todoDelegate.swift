//
//  todoDelegate.swift
//  TaskManagment
//
//  Created by Jessie Dowding on 11/29/17.
//  Copyright © 2017 Cristian Meya Jessie. All rights reserved.
//

import Foundation

@objc protocol todoDelegate {
    
    func addToList(title: String, note: String)
}
