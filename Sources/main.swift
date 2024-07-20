//necessary variables
var tries = 0
let possibleCharacters:Set<String.Element> = ["1","2","3","4","5","6","7","8"]
var correctAnswer:String = GenerateCorrectAnswer()

//run the game
GameLoop()

func GameLoop()
{
    GameIntro()
    repeat
    {
        print("Try \(tries+1)")
        if AwaitAnswer()
        {
            print("You broke the code! Congratulations!") //add how many tries it took
            readLine()
            break
        }
        else if tries == 12
        {
            print("You lost...")
            readLine()
            break
        }
    }while tries<12
}

//explain the rules to the player
func GameIntro()
{
    print("Welcome to the code-breaking game MasterMind, written in Swift!")
    print("Try to guess the number sequence of numbers from 1-8!")
    print("Every number can be used once")
    print("You have 12 tries")
}

//returns a 4 letter string made with elements from possibleCharacters
func GenerateCorrectAnswer() -> String
{
    var correctAnswer = ""
    repeat
    {
        let charToAdd = possibleCharacters.randomElement()!
        if !correctAnswer.contains(charToAdd)
        {
            correctAnswer += String(charToAdd)
        }
    }while correctAnswer.count < 4
    return correctAnswer
}

//asks for an answer and returns true if its correct
func AwaitAnswer() -> Bool
{
    print("Now write a 4-digit sequence of numbers 1-8")
    let answer = readLine()
    if let unwrappedAnswer = answer
    {
        let setAnswer = Set(unwrappedAnswer)
        let commonCharacters = setAnswer.intersection(possibleCharacters).count
        if unwrappedAnswer.count == 4 && commonCharacters == 4
        {
            tries+=1
            let result = CompareStrings(unwrappedAnswer, correctAnswer)
            if result.exactMatches == 4
            {
                return true
            }
            else
            {
                print("Exact matches: \(result.exactMatches)")
                print("Non-exact matches: \(result.nonExactMatches)")
                return false
            }
        }
        else
        {
            print("Incorrect sequence, try again")
        }
    }
    return false
}

func CompareStrings(_ str1: String, _ str2: String) -> (exactMatches: Int, nonExactMatches: Int)
{
    var exactMatches = 0
    var nonExactMatches = 0
    // Convert strings to arrays for easier indexing
    let arr1 = Array(str1)
    let arr2 = Array(str2)

    // Check for exact matches
    for i in 0..<4 {
        if arr1[i] == arr2[i] {
            exactMatches += 1
        }
    }

    // Use sets to find common characters
    let set1 = Set(arr1)
    let set2 = Set(arr2)
    let commonCharacters = set1.intersection(set2)
    for char in commonCharacters {
        var inStr1ButNotExact = false
        var inStr2ButNotExact = false
        
        for i in 0..<4 {
            if arr1[i] == char && arr2[i] != char {
                inStr1ButNotExact = true
            }
            if arr2[i] == char && arr1[i] != char {
                inStr2ButNotExact = true
            }
        }
        
        if inStr1ButNotExact && inStr2ButNotExact {
            nonExactMatches += 1
        }
    }
    
    return (exactMatches, nonExactMatches)
 }