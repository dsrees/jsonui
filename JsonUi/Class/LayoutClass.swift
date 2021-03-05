//
//  LayoutClass.swift
//  JsonUi
//
//  Created by Daniel Rees on 2/26/21.
//

import SwiftUI

class LayoutData: ObservableObject {
  
  @Published var table: Navigation = Navigation(view: Table(rows: []))
}
