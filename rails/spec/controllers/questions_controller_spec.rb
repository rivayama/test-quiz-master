require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do

  describe 'GET index' do
    before :each do
      @question = create(:valid_question)
      get :index
    end

    it 'assigns the question list' do
      expect(assigns(:questions)).to include @question
    end

    it 'renders the index template' do
      expect(response).to render_template :index
    end
  end

  describe 'GET new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      it 'saves a new question' do
        expect {
          post :create, question: attributes_for(:valid_question)
        }.to change(Question, :count).by(1)
      end

      it 'redirects to root' do
        post :create, question: attributes_for(:valid_question)
        expect(response).to redirect_to root_path
      end
    end

    context 'when invalid params' do
      it 'does not save a new question' do
        expect {
          post :create, question: attributes_for(:invalid_question)
        }.not_to change(Question, :count)
      end

      it 'renders the new template' do
        post :create, question: attributes_for(:invalid_question)
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET show' do
    before :each do
      @question = create(:valid_question)
      get :show, id: @question
    end

    it 'assigns the requested question' do
      expect(assigns(:question)).to eq @question
    end

    it 'renders the show template' do
      expect(response).to render_template :show
    end
  end

  describe 'GET edit' do
    before :each do
      @question = create(:valid_question)
      get :edit, id: @question
    end

    it 'assigns the requested question' do
      expect(assigns(:question)).to eq @question
    end

    it 'renders the edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH update' do
    before :each do
      @question = create(:valid_question)
    end

    context 'with valid params' do
      before :each do
        patch :update, id: @question, question: attributes_for(:edited_question)
        @question.reload
      end

      it 'updates the question' do
        expect(@question.question).to eq attributes_for(:edited_question)[:question]
        expect(@question.answer).to eq attributes_for(:edited_question)[:answer]
      end

      it 'redirects to root' do
        expect(response).to redirect_to root_path
      end
    end

    context 'when invalid params' do
      before :each do
        patch :update, id: @question, question: attributes_for(:invalid_question)
        @question.reload
      end

      it 'does not update the question' do
        expect(@question.question).to eq attributes_for(:valid_question)[:question]
        expect(@question.answer).to eq attributes_for(:valid_question)[:answer]
      end

      it 'renders the edit template' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'POST answer' do
    before :each do
      @question = create(:valid_question)
      @answer = 'Paris'
      post :answer, id: @question, answer: {answer: @answer}
    end

    it 'assigns the requested question' do
      expect(assigns(:question)).to eq @question
    end

    it 'assigns the submitted answer' do
      expect(assigns(:submission)).to eq @answer
    end

    it 'renders the answer template' do
      expect(response).to render_template :answer
    end
  end

end
