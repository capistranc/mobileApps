// Classical Music key generator
//Program takes a root note and creates a list of notes within the songs major/minor key scale
//For simplicity, it is assumed the minor key is a melodic minor
//Program throws error if the user plays a note outside of its scale, or if they play a tritone
//Tritone: Interval between a perfect 5th and perfect 4th
//

import UIKit

var str = "Hello, playground"

//Setup of enumerated types
enum Note:Int{
    case C = 0, Csharp, D, Dsharp, E, F, Fsharp, G, Gsharp, A, Asharp, B
}

enum MusicError:Error{
    case wrongKeyError(String)
    case tritoneError(String)
}

//Helper functions to create major/minor scale keys
let majorKeyPattern = [2,2,1,2,2,2] //These patterns denote the amount of steps between notes when climbing up the scale
let minorKeyPattern = [2,1,2,2,1,2]

func majorKeyNotes(rootNote:Note) -> [Note]{
    var offSet = rootNote.rawValue
    
    let majorKeyNotes = [rootNote] + majorKeyPattern.map{
        offSet = (offSet + $0) % 12
        return Note(rawValue: offSet)!
    }
    
    return majorKeyNotes
}

func minorKeyNotes(rootNote:Note) -> [Note] {
    var offSet = rootNote.rawValue
    var minorKeyNotes:[Note] = [rootNote] + minorKeyPattern.map{
        offSet = (offSet + $0) % 12
        return Note(rawValue: offSet)!
    }
    
    //Assuming melodic minor, we add the major 6th and major 7th as well
    //Major 6th corresponds to the 9th step, Major 7th corresponds to the 11th step
    offSet = rootNote.rawValue
    guard let major6 = Note(rawValue: (offSet + 9) % 12) else {return []}
    guard let major7 = Note(rawValue: (offSet + 11) % 12) else {return []}
    minorKeyNotes.insert(major7, at: 7)
    minorKeyNotes.insert(major6, at: 6)
    
    return minorKeyNotes
}

//Musician class that stores all the notes played, as well as the key they are playing in
class Musician{
    private (set) var notesPlayed:[Note] = []
    private let key:[Note]
    
    init(rootNote:Note, key isMajorOrMinor:String){
        if isMajorOrMinor.lowercased() == "major" {
            key = majorKeyNotes(rootNote: rootNote)
            print("You are playing in \(rootNote)Major")
        } else {
            key = minorKeyNotes(rootNote: rootNote)
            print("You are playing in \(rootNote)minor")
        }
        
    }
    
    func inKey(nextNote:Note) -> Bool{
        return key.contains(nextNote)
    }
    
    func hasTritone(nextNote:Note) -> Bool{
        guard let lastNote = notesPlayed.last else {return false}
        return abs(lastNote.rawValue - nextNote.rawValue) == 6
    }
    
    func stringifyKey() -> String{
        return key.map{String(describing: $0)}.joined(separator: ", ")
    }
    
    func printKey() {
        print(stringifyKey())
    }
    
    func printNotesPlayed() {
        print(notesPlayed.map{String(describing: $0)}.joined(separator: ", "))
    }
    
    func playNote(_ note:Note) {
        notesPlayed.append(note)
    }
}

//Error catching logic

func playMusic(player:Musician, note:Note) throws{
    if !player.inKey(nextNote: note){
        throw MusicError.wrongKeyError("You played \(note). Please play in key, one of these notes: \(player.stringifyKey())")
    }
    
    if player.hasTritone(nextNote: note) {
        throw MusicError.tritoneError("This note(\(note)) is a tritone away from the last note you played \(player.notesPlayed.last!), it sounds TERRIBLE")
    }
    
    player.playNote(note)
    
}


//Test functions
let notesPlayed:[Note] = [.C, .Csharp]
let nextNote:Note = .G
let myMusician = Musician(rootNote: .C, key: "major")

do {
    try playMusic(player:myMusician, note: .A)
    try playMusic(player:myMusician, note: .B)
    try playMusic(player:myMusician, note: .F)
    try playMusic(player:myMusician, note: .B)
}catch MusicError.wrongKeyError(let error) {
    print(error)
}catch MusicError.tritoneError(let error) {
    print(error)
}
