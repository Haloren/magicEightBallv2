users = [
    {username: "username", email: "email@email.com", password: "password"}
    ]
users.each do |user|
    User.create(user)
end

answerlists = [
    {list_name: "Yes or No", user_id: 1}
    ]
answerlists.each do |list|
    AnswerList.create(list)
end

answers = [
    {content: "Yes.", answer_list_id: 1},
    {content: "No.", answer_list_id: 1}
]
answers.each do |content|
    Answer.create(content)
end