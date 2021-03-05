//
//  Table.swift
//  JsonUi
//
//  Created by Daniel Rees on 2/26/21.
//

import SwiftUI

struct Row: View, Codable {
  
  var id: Int
  var title: String
  var subtitle: String
  
  var body: some View {
    print("Returning Row: \(title)")
    
    return VStack(alignment: .leading) {
      Text(title)
      Text(subtitle)
    }
  }
}


struct Table: View, Codable {
  
  var rows: [Row]
  var navigationTitle: String = ""
    
var body: some View {
    List(rows, id: \.id) { $0 }
      .navigationTitle(self.navigationTitle)
  }
}

struct Navigation: View, Codable {
  
  var view: Table
  
  var body: some View {
    NavigationView {
      view
    }
  }
}
