//
//  State.swift
//  FacadeTraining
//
//  Created by Lorena Mrsic on 30/03/2021.
//

import Foundation

struct State {
  var name: String
  var taxFraction: Float
  
  init(name: String, taxFraction: Float) {
    self.name = name
    self.taxFraction = taxFraction
  }
  
  func getStates() -> Array<Any> {
    return [self.name, self.taxFraction]
  }
}
