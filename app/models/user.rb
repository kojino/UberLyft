class User < ApplicationRecord
  # enum status: ({
  #   onboarding: { initial: 0, ask_master: 1, check_master: 2 },
  #   normal: { normal: 3 },
  #   ask: { ask_start: 4, ask_destination: 5, check_destination: 6 },
  #   answer: { recommendation_requested: 7, answer_now: 8, check_answer: 9 }
  # }.values.flatten.reduce({}) { |sum, x| sum.merge(x) })
end
