//
//  ContentView.swift
//  JsonUi
//
//  Created by Daniel Rees on 2/26/21.
//

import SwiftUI





func load2<T: Decodable>(_ filename: String) -> T {
  
  let data: Data

//  Create a json file in `/tmp/$filename`
  let url = URL(fileURLWithPath: "/tmp/\(filename)")

  do {
    data = try Data(contentsOf: url)
  } catch {
    fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
  }
  
  
  do {
    let decoder = JSONDecoder()
    return try decoder.decode(T.self, from: data)
  } catch {
    fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
  }
}




struct ContentView: View {
  
  @ObservedObject var layout: LayoutData
  
  init() {
    layout = LayoutData()
    
    // Before running, copy ~/JsonUi/Data/layout.json to /tmp/
    layout.table = load2("layout.json")
  }
  
  
  
  var body: some View {
    let _ = print("ContentView Body Returned")
    let _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
      layout.table = load2("layout.json")
    }
    
    layout.table
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
