//
//  ContentView.swift
//  Hello
//
//  Created by Ron White on 7/27/21.
//

import SwiftUI


struct ContentView: View
{
    
    /// on state change notify these publishers
    @StateObject var boxCast: Boxcast
    @StateObject var charsString: CharsString
    
    /// initialize all other elements
    let charFormView = CharForm.init(
        model: CharFormModel(),
        textFieldHasFocus: true
    )
    
    /// work methods
    func getBoxcast(i:Int) -> String {
        let array = boxCast.getBoxcastCharacters()
        let range = i..<array.count
        var string = ""
        
        for index in range {
            string = string + String(array[index])
            print("ContentView.getBoxcast index \(index) with range \(range) produces character \(string)")
        }
        return string
    }
    
    func getCharsStringUUID() -> String {
        let uuid = charsString.getUUID()
        return uuid
    }
    
    var body: some View {
        
            /// Text views as a V stack
            VStack(alignment: .trailing) {
                Spacer()
                /// Text row
                Text("UUID: \(getCharsStringUUID())...")
                    .padding(20)
                    .multilineTextAlignment(.center)
                
                /// Form row
                charFormView.body
                    .padding(20)
                    .multilineTextAlignment(.center)
                
                /// Text row
                Text(getBoxcast(i:2))
                    .padding(20)
                    .multilineTextAlignment(.center)
                
                /// Text row 4, Each char'
                
                Spacer()
            }
        
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View {
        
        if #available(iOS 15.0, *) {
            /// for Preview frame
        } else {
            /// Fallback on earlier versions
        }
    }
}
