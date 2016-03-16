require 'rails_helper'

feature 'new page' do
  context 'with valid params' do
    scenario 'shows a success message' do
      visit new_question_path
      fill_in 'Question', with: 'New question'
      fill_in 'Answer', with: 'The answer'
      click_on 'Create Question'
      expect(page).to have_content 'Question created successfully.'
    end
  end

  context 'with invalid params' do
    scenario 'shows error messages' do
      visit new_question_path
      fill_in 'Question', with: ''
      fill_in 'Answer', with: ''
      click_on 'Create Question'
      expect(page).to have_content 'Question can\'t be blank'
      expect(page).to have_content 'Answer can\'t be blank'
    end
  end
end

feature 'edit page' do
  background do
    @question = Question.new({question: 'New question', answer: 'The answer'})
    @question.save
    visit edit_question_path(@question)
  end

  context 'with valid params' do
    scenario 'shows a success message' do
      fill_in 'Question', with: 'Edited question'
      fill_in 'Answer', with: 'Edited answer'
      click_on 'Update Question'
      expect(page).to have_content 'Question saved successfully.'
    end
  end

  context 'with invalid params' do
    scenario 'shows error messages' do
      fill_in 'Question', with: ''
      fill_in 'Answer', with: ''
      click_on 'Update Question'
      expect(page).to have_content 'Question can\'t be blank'
      expect(page).to have_content 'Answer can\'t be blank'
    end
  end
end

feature 'answer page' do
  background do
    @question = Question.new({question: 'New question', answer: 'The answer'})
    @question.save
    visit question_path(@question)
  end

  context 'with correct answer' do
    scenario 'shows a celebration message' do
      fill_in 'answer_answer', with: 'The answer'
      click_on 'Submit answer'
      expect(page).to have_content 'Well done!'
    end
  end

  context 'with wrong answer' do
    scenario 'shows a encouragement message' do
      fill_in 'answer_answer', with: 'Wrong answer'
      click_on 'Submit answer'
      expect(page).to have_content 'Uh-oh,'
    end
  end
end
