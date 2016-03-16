class Question < ActiveRecord::Base

  validates_presence_of :question
  validates_presence_of :answer

  def is_correct?(submission)
    normalize_answer(answer) == normalize_answer(submission)
  end

  private

  def normalize_answer(str)
    str.strip
      .gsub(/\s{2,}/, ' ')
      .downcase
      .gsub(/(\d+)/) { |m| m.to_i.to_words }
  end

end
