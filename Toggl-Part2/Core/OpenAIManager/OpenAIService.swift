import Foundation

// Define a structure for the response
struct QuestionData {
    let question: String
    let choices: [String]
    let correctAnswerIndex: Int
    let explanation: String
}

class OpenAIService {
    private let apiKey = "your_openai_api_key"  // Replace with your actual OpenAI API key
    
    func fetchQuestion(for mode: String, completion: @escaping (QuestionData?) -> Void) {
        let url = URL(string: "https://api.openai.com/v1/chat/completions")!
        
        // Define the prompt
        let prompt = "Generate a question for \(mode). Provide four answer choices with only one correct answer. Format the response as a JSON object with the keys 'question', 'choices', 'correctAnswerIndex', and 'explanation'."
        
        // Create the JSON payload for the request
        let requestData: [String: Any] = [
            "model": "gpt-4",
            "messages": [
                ["role": "user", "content": prompt]
            ]
        ]
        
        // Serialize requestData into JSON data
        let jsonData = try! JSONSerialization.data(withJSONObject: requestData, options: [])
        
        // Configure the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        // Send the request using URLSession
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "No data")")
                completion(nil)
                return
            }
            
            // Decode JSON response
            do {
                let decodedResponse = try JSONDecoder().decode(OpenAIResponse.self, from: data)
                if let questionData = self.parseQuestionData(from: decodedResponse) {
                    completion(questionData)
                } else {
                    completion(nil)
                }
            } catch {
                print("Failed to decode JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    // Parse the response data into QuestionData
    private func parseQuestionData(from response: OpenAIResponse) -> QuestionData? {
        guard let jsonData = response.choices.first?.message.content.data(using: .utf8) else {
            return nil
        }
        
        struct APIResponse: Decodable {
            let question: String
            let choices: [String]
            let correctAnswerIndex: Int
            let explanation: String
        }
        
        do {
            let decodedData = try JSONDecoder().decode(APIResponse.self, from: jsonData)
            return QuestionData(
                question: decodedData.question,
                choices: decodedData.choices,
                correctAnswerIndex: decodedData.correctAnswerIndex,
                explanation: decodedData.explanation
            )
        } catch {
            print("Failed to parse JSON: \(error)")
            return nil
        }
    }
}

// Define a structure matching OpenAI’s response format
struct OpenAIResponse: Codable {
    struct Choice: Codable {
        struct Message: Codable {
            let content: String
        }
        let message: Message
    }
    let choices: [Choice]
}
