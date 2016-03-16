FactoryGirl.define do
  factory :valid_question, class: Question do
    question 'New question'
    answer 'The answer'
  end

  factory :invalid_question, class: Question do
    question ''
    answer ''
  end

  factory :edited_question, class: Question do
    question 'Edited question'
    answer 'Edited answer'
  end
end
