//intro to the game
print("Welcome to the code-breaking game MasterMind, written in Swift!")
print("Try to guess the number sequence of numbers from 1-8!")
print("Every number can be used once")
print("You have 12 tries")
//necessary variables
var tries = 0
let possibleCharacters:[String] = ["1","2","3","4","5","6","7","8"]
var correctAnswer:String = ""
//generate the correct answer
repeat
{
    let charToAdd = possibleCharacters[Int.random(in: 0...7)]
    if !correctAnswer.contains(charToAdd)
    {
        correctAnswer += charToAdd
    }
}while correctAnswer.count < 4
//game loop
repeat
{
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

//asks for an answer and returns true if its correct
func AwaitAnswer() -> Bool
{
    print("Now write a 4-digit sequence of numbers 1-8")
    let answer = readLine()
    if let unwrappedAnswer = answer
    {
        //FIXME: if you insert a 4-letter sequence of letters it doesnt stop, wooooops
        if unwrappedAnswer.count == 4 && !unwrappedAnswer.contains("9") && !unwrappedAnswer.contains("0") 
        {
            tries+=1
            //TODO: check if answer is correct and return true or false. First must have generated an answer
        }
        else
        {
            print("Incorrect sequence, try again")
        }
    }
    return false
}