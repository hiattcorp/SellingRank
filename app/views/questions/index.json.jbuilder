json.array!(@questions) do |question|
  json.extract! question, :id, :category, :question_text, :option1, :option2, :option3, :option4, :option5, :answer, :points
  json.url question_url(question, format: :json)
end
