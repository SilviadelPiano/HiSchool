class User < ApplicationRecord

  ROLES = %w[parent student teacher].freeze

  acts_as_user :roles => [ :parent, :student, :teacher ]
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 30 }, format: { with: /\A[A-Z][a-zA-Z][^#&<>\"~;$^%{}?]{1,20}\z/ }
  validates :surname, presence: true, length: { maximum: 30 }, format: { with: /\A[a-zA-Z ,.'-]+\z/ }
  validates :birth_place, presence: true, length: { maximum: 30 }, format: { with: /\A[A-Z][a-zA-Z ,.'-]+\z/ }
  validates :birth_date, presence: true # Up to now I don't know how to validate this
  validates :roles, presence: true # to see if even format is needed
  # Not doing email and password validation as it works with Devise
  validates :sex, presence: true, format: { with: /\AM|F\z/ }
  validates :CF, presence: true, uniqueness: true, format: { with: /\A(?:[A-Z][AEIOU][AEIOUX]|[B-DF-HJ-NP-TV-Z]{2}[A-Z]){2}(?:[\dLMNP-V]{2}(?:[A-EHLMPR-T](?:[04LQ][1-9MNP-V]|[15MR][\dLMNP-V]|[26NS][0-8LMNP-U])|[DHPS][37PT][0L]|[ACELMRT][37PT][01LM]|[AC-EHLMPR-T][26NS][9V])|(?:[02468LNQSU][048LQU]|[13579MPRTV][26NS])B[26NS][9V])(?:[A-MZ][1-9MNP-V][\dLMNP-V]{2}|[A-M][0L](?:[1-9MNP-V][\dLMNP-V]|[0L][1-9MNP-V]))[A-Z]\z/ }
  # Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character:
  validates :password, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}\z/ }
  
end
